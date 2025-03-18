import 'package:flutter/material.dart';



class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({super.key, required this.title, required this.bussID});

  final String title;
  final String bussID;

  @override
  State<BusinessDetailScreen> createState() => BusinessDetailScreenPageState();

}

class BusinessDetailScreenPageState extends State<BusinessDetailScreen> {


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
            const Image(
              image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
            ),
            
            Text("sema")
          ],
        ),
      ),

    );
  }
}
