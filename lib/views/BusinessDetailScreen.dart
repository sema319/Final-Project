import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalproject/views/ReservationScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/clientConfig.dart';
import '../models/BusinessModel.dart';
import 'package:http/http.dart' as http;

class BusinessDetailScreen extends StatefulWidget {
  const BusinessDetailScreen(
      {super.key, required this.title, required this.bussID});

  final String title;
  final String bussID;

  @override
  State<BusinessDetailScreen> createState() => BusinessDetailScreenPageState();
}

late BusinessModel _currBuss;

class BusinessDetailScreenPageState extends State<BusinessDetailScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    getBussDetails();
  }

  Future<void> getBussDetails() async {
    setState(() {
      _isLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var bussID = await prefs.get('lastBussID');
    var url = "businesses/getBussDetails.php?bussID=" + bussID.toString();
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    _currBuss = BusinessModel.fromJson(json.decode(response.body));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4, // 40% of screen height
              width: double.infinity,
              child: CachedNetworkImage(
                imageUrl: _currBuss.imageURL,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ${_currBuss.businessName}",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text("Phone 1: ${_currBuss.phone1}"),
                  Text("Phone 2: ${_currBuss.phone2}"),
                  Text("Capacity: ${_currBuss.capacity.toString()}"),
                  Text("Address: ${_currBuss.address}"),
                  Text("Price: ${_currBuss.price.toString()}"),
                  SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ReservationScreen(title: 'Reservation'),
                          ),
                        );
                      },
                      child: Text('Reserve a Date', style: TextStyle(fontSize: 16)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}