import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/clientConfig.dart';
import '../models/BusinessModel.dart';
import 'package:http/http.dart' as http;



class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen({super.key, required this.title, required this.bussID});

  final String title;
  final String bussID;

  @override
  State<BusinessDetailScreen> createState() => BusinessDetailScreenPageState();

}


late BusinessModel _currBuss;


class BusinessDetailScreenPageState extends State<BusinessDetailScreen> {


  Future<void> getBussDetails() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var bussID = await prefs.get('lastBussID');

    var url = "businesses/getBussDetails.php?bussID=" + bussID.toString();
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);

    _currBuss = BusinessModel.fromJson(json.decode(response.body));
    setState(() {

    });

  }


  @override
  Widget build(BuildContext context) {

    getBussDetails();


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(
              image: NetworkImage(_currBuss.imageURL),
            ),
            
            Text("Name: " + _currBuss.businessName),
            Text("phone1: " + _currBuss.phone1),
            Text("phone2: " + _currBuss.phone2),
            Text("capcity: " + _currBuss.capacity.toString()),
            Text("address: " + _currBuss.address),
            Text("price: " + _currBuss.price.toString()),




          ],
        ),
      ),

    );
  }
}
