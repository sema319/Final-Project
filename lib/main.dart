import 'dart:io';

import 'package:finalproject/views/BusinessMangerScreen.dart';
import 'package:finalproject/views/DateReservation.dart';
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
              "PhoneNumber:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your PhoneNumber'
              ),
            ),

            Text(
              "Password:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'enter your Password'
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
                    MaterialPageRoute(builder: (context) => const PaymentScreen(title: 'Payment',)));
              },
              child: Text('Payment'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RegisterationDetailScreen(title: 'Registeration',)));
              },
              child: Text('Registeration'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BusinessMangerScreen(title: 'Manager',)));
              },
              child: Text('Manager'),
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DateReservationScreen(title: 'Manager',)));
              },
              child: Text('Manager'),
            ),

            /*TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DateReservationScreen(title: 'date',)));
              },
              child: Text('date'),
            ),*/
          ],
        ),
      ),
    );
  }
}


