import 'package:finalproject/Utils/Utils.dart';
import 'package:finalproject/Utils/db.dart';
import 'package:flutter/material.dart';

import '../models/UserModel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterScreen> createState() => RegisterScreenPageState();
}

class RegisterScreenPageState extends State<RegisterScreen> {
  final _txtFirstName = new TextEditingController();
  final _txtLastName = new TextEditingController();
  final _txtEmail = new TextEditingController();
  final _txtPassword = new TextEditingController();
  final _txtPhoneNumber = new TextEditingController();

  void insertUserFunc() {
    if(_txtFirstName.text != "" && _txtPassword.text != "" && _txtLastName.text != "" && _txtPhoneNumber.text != "" && _txtEmail.text !="")
      {
        var user = new User();
        user.firstName = _txtFirstName.text;
        user.lastName = _txtLastName.text;
        user.email = _txtEmail.text;
        user.password = _txtPassword.text;
        user.phoneNumber = _txtPhoneNumber.text;

        insertUser(user);
      }
    else
      {
        var uti = new Utils();
        uti.showMyDialog(context, "חובה", "כל השדות חובה");
      }
  }

  @override
  Widget build(BuildContext context) {
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
              "email*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'enter your email'),
            ),
            Text(
              "Password*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtEmail,
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
                insertUserFunc();
              },
              child: Text('register'),
            ),
          ],
        ),
      ),
    );
  }
}
