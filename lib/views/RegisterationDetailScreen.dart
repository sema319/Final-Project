import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';



class RegisterationDetailScreen extends StatefulWidget {
  const RegisterationDetailScreen({super.key, required this.title});

  final String title;

  @override
  State<RegisterationDetailScreen> createState() => RegisterationDetailScreenPageState();
// State<PaymentScreen> createState() => PaymentScreenPageState();

}

class RegisterationDetailScreenPageState extends State<RegisterationDetailScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,

        title: Text(widget.title),
      ),
    body: Center(

    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(":שם לקוח", style: TextStyle(fontSize: 20),
        ),
        Text(":מםפר טלפון", style: TextStyle(fontSize: 20),
        ),
        Text(":תאריך", style: TextStyle(fontSize: 20),
        ),
      ],
    ),
    ),

    );
  }
}