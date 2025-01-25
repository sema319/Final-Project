import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';



class BusinessMangerScreen extends StatefulWidget {
  const BusinessMangerScreen({super.key, required this.title});

  final String title;

  @override
  State<BusinessMangerScreen> createState() => BusinessMangerScreenPageState();
// State<PaymentScreen> createState() => PaymentScreenPageState();

}

class BusinessMangerScreenPageState extends State<BusinessMangerScreen> {


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
              ],

        ),
      ),

    );
  }
}