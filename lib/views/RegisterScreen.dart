import 'package:finalproject/Utils/Utils.dart';
import 'package:finalproject/Utils/clientConfig.dart';
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


  @override
  Widget build(BuildContext context) {


    Future insertUser(BuildContext context, String firstName, String lastName) async {
      if(_txtFirstName.text != "" && _txtLastName.text != "" && _txtPassword.text != "" && _txtPhoneNumber.text != "")
        {
          var url = "users/insertUser.php?firstName=" + _txtFirstName.text + "&lastName=" + _txtLastName.text +
                 "&password=" + _txtPassword.text + "&phone=" + _txtPhoneNumber.text;
          final response = await http.get(Uri.parse(serverPath + url));
          print(serverPath + url);
          // setState(() { });
          // Navigator.pop(context);
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Homepagescreen(title: 'Home Page',))
          );
        }
      else
        {
          var uti = new Utils();
          uti.showMyDialog(context, "Required", "All fields are required.");
        }
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
                  border: OutlineInputBorder(), hintText: 'Enter your Name'),
            ),
            Text(
              "Last name*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtLastName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Last Name'),
            ),
            Text(
              "Password*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a Password'),
            ),
            Text(
              "PhoneNumber*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtPhoneNumber,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your PhoneNumber'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {

                insertUser(context,  _txtFirstName.text, _txtLastName.text,);
              },
              child: Text('Enter'),
            ),


          ],
        ),

      ),

    );

  }
}
