import 'dart:convert';
import 'dart:io';
import 'package:finalproject/views/HomePageScreen.dart';
import 'package:finalproject/views/RegisterScreen.dart';
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
      }
    } on SocketException catch (_) {
      var uti = new Utils();
      uti.showMyDialog(context, "No internet", "The app requires an internet connection. Please connect.");
      return;
    }
  }



  Future checkLogin(BuildContext context) async {

    var url = "checkLogin/checkLogin.php?phone=" + _txtPhone.text + "&password=" + _txtPassword.text;
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    if(checkLoginModel.fromJson(jsonDecode(response.body)).userID == 0)
    {
      var uti = new Utils();
      uti.showMyDialog(context, "Error", "phone or password is wrong");
    }
    else
    {;
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', checkLoginModel.fromJson(jsonDecode(response.body)).userID!.toString());
      await prefs.setString('phone', _txtPhone.text);
      await prefs.setString('password', _txtPassword.text);

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
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your PhoneNumber'
              ),
            ),

            Text(
              "Password:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              controller: _txtPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Password'
              ),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                if (_txtPhone.text.isEmpty || _txtPassword.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Error"),
                      content: Text("Please fill in all the fields"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("OK"),
                        ),
                      ],
                    ),
                  );
                } else {
                  checkLogin(context);
                }
              },
              child: Text('Log In'),
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


