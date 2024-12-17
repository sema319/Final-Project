import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';



class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.title});

  final String title;

  @override
  State<PaymentScreen> createState() => PaymentScreenPageState();
// State<PaymentScreen> createState() => PaymentScreenPageState();

}

class PaymentScreenPageState extends State<PaymentScreen> {


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
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const businessDetailScreen(
                          title: 'Business Page',)));
              },
              child: Text('ApplePay'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const businessDetailScreen(
                          title: 'Business Page',)));
              },
              child: Text('Visa'),
            ),

          ],
        ),
      ),

    );
  }
}