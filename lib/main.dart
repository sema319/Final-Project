import 'package:finalproject/views/RegisterScreen.dart';
import 'package:flutter/material.dart';

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
              "password:", style: TextStyle(fontSize: 20),
            ),

            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'enter a password'
              ),
            ),


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

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {},
              child: Text('log in'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Registerscreen(title: 'register',)));
              },
              child: Text('create new account'),
            ),




          ],
        ),
      ),

    );
  }
}
