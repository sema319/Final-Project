import 'dart:io';

import 'package:finalproject/views/BusinessMangerScreen.dart';
import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/HomePageScreen.dart';
import 'package:finalproject/views/PaymentScreen.dart';
import 'package:finalproject/views/RegisterScreen.dart';
import 'package:finalproject/views/RegisterationDetailScreen.dart';
import 'package:flutter/material.dart';

import 'Utils/Utils.dart';



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



  void _incrementCounter() {
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    checkConction();


    return Scaffold(
    appBar: AppBar(

      //  backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: IconButton(

          icon: Icon(Icons.person),
          color: Colors.black,

          iconSize: 30,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfileScreen(title: 'Edit Profile',)
                )
            );
          },


        ),

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
              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Homepagescreen(title: 'Home Page',)));
                },
              child: Text('Next'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterScreen(title: 'register',)));
              },
              child: Text('create new account'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Homepagescreen(title: 'Home Page',)));
              },
              child: Text('HomePage'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PaymentScreen(title: 'Home Page',)));
              },
              child: Text('payment'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterationDetailScreen(title: 'Home Page',)));
              },
              child: Text('registeration'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BusinessMangerScreen(title: 'Home Page',)));
              },
              child: Text('manager'),
            ),



          ],
        ),
      ),

    );
  }
}


