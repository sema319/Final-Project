import 'package:finalproject/Utils/Utils.dart';
import 'package:flutter/material.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});



  final String title;

  @override
  State<RegisterScreen> createState() => RegisterScreenPageState();
}

class RegisterScreenPageState extends State<RegisterScreen> {
  final _txtFirstName =  new TextEditingController();
  final _txtLastName =  new TextEditingController();
  final _txtPassword = new TextEditingController();

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
              "First Name:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              controller: _txtFirstName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your name'
              ),
            ),

            Text(
              "last name:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              controller: _txtLastName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your last name'
              ),
            ),

            Text(
              "password:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              controller: _txtPassword,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter a password'

              ),

            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                var uti = new Utils();
                uti.showMyDialog(context,_txtFirstName.text,_txtLastName.text);

              },
              child: Text('register'),
            ),





          ],
        ),
      ),

    );



  }
}
