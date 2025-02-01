import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/BusinessDetailScreen.dart';
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


            SizedBox(
              height: 200.0,
              child: ListView.builder(
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 15,
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Center(child: Text('Dummy Card Text')),
                ),
              ),
            ),

            Text(
              "אירוח",
              style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),

            ),

          ],
        ),
      ),

    );
  }
}
