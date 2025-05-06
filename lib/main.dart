import 'dart:convert';
import 'dart:io';
import 'package:finalproject/views/BusinessMangerScreen.dart';
import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/EventsScreen.dart';
import 'package:finalproject/views/HomePageScreen.dart';
import 'package:finalproject/views/PaymentScreen.dart';
import 'package:finalproject/views/RegisterScreen.dart';
import 'package:finalproject/views/ReservationDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Utils/Utils.dart';
import 'Utils/clientConfig.dart';
import 'models/checkLoginModel.dart';
import 'package:http/http.dart' as http;



void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: "Sema's Home Page"),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _txtPhone = new TextEditingController();
  final _txtPassword = new TextEditingController();



  checkConction() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        // print('connected to internet');// print(result);// return 1;
      }
    } on SocketException catch (_) {
      // print('not connected to internet');// print(result);
      var uti = new Utils();
      uti.showMyDialog(context, "אין אינטרנט", "האפליקציה דורשת חיבור לאינטרנט, נא להתחבר בבקשה");
      return;
    }
  }



  Future checkLogin(BuildContext context) async {

    //   SharedPreferences prefs = await SharedPreferences.getInstance();
    //  String? getInfoDeviceSTR = prefs.getString("getInfoDeviceSTR");
    var url = "checkLogin/checkLogin.php?phone=" + _txtPhone.text + "&password=" + _txtPassword.text;
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    // setState(() { });
    // Navigator.pop(context);
    if(checkLoginModel.fromJson(jsonDecode(response.body)).userID == 0)
    {
      // return 'ת.ז ו/או הסיסמה שגויים';
      var uti = new Utils();
      uti.showMyDialog(context, "Error", "phone or email is wrong");
    }
    else
    {
      // print("SharedPreferences 1");
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', checkLoginModel.fromJson(jsonDecode(response.body)).userID!.toString());
      await prefs.setString('phone', _txtPhone.text);
      await prefs.setString('password', _txtPassword.text);

      // await prefs.setString('userType', checkLoginModel.fromJson(jsonDecode(response.body)).userTypeID!);
      // return null;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Homepagescreen(title: 'Home Page',)));
    }
  }



  fillSavedPars() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _txtPhone.text = prefs.get("phone").toString();
    _txtPassword.text = prefs.get("password").toString();
    if(_txtPhone.text != "" && _txtPassword.text != "")
    {
      checkLogin(context);
    }
  }




  @override
  Widget build(BuildContext context) {
    checkConction();
    fillSavedPars();

    return Scaffold(
    appBar: AppBar(

      //  backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Text(
              "PhoneNumber:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              controller: _txtPhone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your PhoneNumber'
              ),
            ),

            Text(
              "Password:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              controller: _txtPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your Password'
              ),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                if (_txtPhone.text.isEmpty || _txtPassword.text.isEmpty) {
                  // إذا واحد من الحقول فاضي
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("خطأ"),
                      content: Text("الرجاء تعبئة كافة الحقول"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("حسناً"),
                        ),
                      ],
                    ),
                  );
                } else {
                  // إذا الحقول معبّاة، كمل عملية تسجيل الدخول
                  checkLogin(context);
                }
              },
              child: Text('Login'),
            ),

            Text(
              "New Account?", style: TextStyle(fontSize: 15),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen(title: 'Sign Up',)));
              },
              child: Text('Create New Account'),
            ),
          ],
        ),
      ),
    );
  }
}


