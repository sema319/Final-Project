import 'package:finalproject/Utils/Utils.dart';
import 'package:finalproject/Utils/clientConfig.dart';
import 'package:finalproject/Utils/db.dart';
import 'package:finalproject/views/HomePageScreen.dart';
import 'package:flutter/material.dart';
import '../models/UserModel.dart';
import 'package:http/http.dart' as http;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => RegisterScreenPageState();
}

class RegisterScreenPageState extends State<RegisterScreen> {
  final _txtFirstName = new TextEditingController();
  final _txtLastName = new TextEditingController();
  final _txtPassword = new TextEditingController();
  final _txtPhoneNumber = new TextEditingController();

  /*
  void insertUserFunc() {
    if(_txtFirstName.text != "" && _txtPassword.text != "" && _txtLastName.text != "" && _txtPhoneNumber.text != "" )
      {
        var user = new User();
        user.firstName = _txtFirstName.text;
        user.lastName = _txtLastName.text;
        user.password = _txtPassword.text;
        user.phoneNumber = _txtPhoneNumber.text;
        // insertUser(user);
      }
    else
      {
        var uti = new Utils();
        uti.showMyDialog(context, "חובה", "כל השדות חובה");
      }
  }
  */

  @override
  Widget build(BuildContext context) {


    Future insertUser(BuildContext context, String firstName, String lastName) async {
      //   SharedPreferences prefs = await SharedPreferences.getInstance();
      //  String? getInfoDeviceSTR = prefs.getString("getInfoDeviceSTR");
      var url = "users/insertUser.php?firstName=" + firstName + "&lastName=" + lastName;
      final response = await http.get(Uri.parse(serverPath + url));
      print(serverPath + url);
      // setState(() { });
      // Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepagescreen(title: 'Home Page',))
      );
    }



    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "First Name*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtFirstName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'enter your name'),
            ),
            Text(
              "Last name*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtLastName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your last name'),
            ),
            Text(
              "Password*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'enter a password'),
            ),
            Text(
              "PhoneNumber*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtPhoneNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'enter your phone number'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {

                insertUser(context,  _txtFirstName.text, _txtLastName.text,);
              },
              child: Text('register'),
            ),


          ],
        ),

      ),

    );

  }
}
