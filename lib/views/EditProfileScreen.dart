import 'package:flutter/material.dart';



class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.title});



  final String title;

  @override
  State<EditProfileScreen> createState() => EditProfileScreenPageState();
}

class EditProfileScreenPageState extends State<EditProfileScreen> {


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

          ],
        ),
      ),

    );
  }
}
