import 'package:flutter/material.dart';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.title});



  final String title;

  @override
  State<RegisterScreen> createState() => RegisterScreenPageState();
}

class RegisterScreenPageState extends State<RegisterScreen> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
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
              "name:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your name'
              ),
            ),



            Text(
              "last name:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your last name'
              ),
            ),

            Text(
              "password:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter a password'
              ),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () { },
              child: Text('register'),
            ),




          ],
        ),
      ),

    );
  }
}
