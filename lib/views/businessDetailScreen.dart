import 'package:flutter/material.dart';



class businessDetailScreen extends StatefulWidget {
  const businessDetailScreen({super.key, required this.title});



  final String title;

  @override
  State<businessDetailScreen> createState() => businessDetailScreenPageState();
  // State<Homepagescreen> createState() => HomepagescreenPageState();

}

class businessDetailScreenPageState extends State<businessDetailScreen> {


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
