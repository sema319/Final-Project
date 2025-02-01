import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:finalproject/views/RegisterationDetailScreen.dart';
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Card(
          child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
            const ListTile(
              leading: Icon(Icons.album),
              title: Text('The Enchanted Nightingale'),
              subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
              TextButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.blue),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegisterationDetailScreen(
                                title: 'Home Page',
                              )));
                },
                child: Text('registeration'),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
