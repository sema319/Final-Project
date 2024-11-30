import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/businessDetailScreen.dart';
import 'package:flutter/material.dart';



class Homepagescreen extends StatefulWidget {
  const Homepagescreen({super.key, required this.title});



  final String title;

  @override
  State<Homepagescreen> createState() => HomepagescreenPageState();
}

class HomepagescreenPageState extends State<Homepagescreen> {





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
              "אולם",
              style: TextStyle(fontSize: 30),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const businessDetailScreen(title: 'business Detail',)));
              },
              child: Text(
                  "אולם אלנור",
                  style: TextStyle(fontSize: 30)
            ),
            ),
            
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),


            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              height: 200,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Container(
                    width: 160,
                    color: Colors.red,
                  ),
                  Container(
                    width: 160,
                    color: Colors.blue,
                  ),
                  Container(
                    width: 160,
                    color: Colors.green,
                  ),
                  Container(
                    width: 160,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: 160,
                    color: Colors.orange,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}
