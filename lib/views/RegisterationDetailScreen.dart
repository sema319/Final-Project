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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                height: 200,

                child: ListView(
                  padding: const EdgeInsets.all(8),

                  children: <Widget>[

                    Container(
                      height: 50,
                      color: Colors.amber[600],
                      child: const Center(child: Text('Entry A')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[500],
                      child: const Center(child: Text('Entry B')),
                    ),
                    Container(
                      height: 50,
                      color: Colors.amber[100],
                      child: const Center(child: Text('Entry C')),
                    ),
                  ],
                )
                ),
          ],
        )

      ),

    );
  }
}