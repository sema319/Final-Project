import 'dart:convert';

import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';
import '../Utils/clientConfig.dart';
import '../models/BusinessModel.dart';
import 'package:http/http.dart' as http;

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
      body: FutureBuilder(
        future: getBusiness(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          }

          if (projectSnap.hasError) {
            print(projectSnap.error);
            return Center(
              child: Text('שגיאה, נסה שוב',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            );
          }

          if (projectSnap.hasData) {
            final List<BusinessModel> businesses =
            projectSnap.data as List<BusinessModel>;

            if (businesses.isEmpty) {
              return Center(
                child: Text('אין תוצאות',
                    style: TextStyle(fontSize: 23, color: Colors.black)),
              );
            } else {
              return ListView.builder(
                itemCount: businesses.length,
                itemBuilder: (context, index) {
                  final project = businesses[index];
                  return Card(
                    child: ListTile(
                      enabled: false,
                      onTap: () {},
                      title: Text(
                        project.businessName ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      subtitle: Text(
                        project.capacity?.toString() ?? '',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      isThreeLine: false,
                    ),
                  );
                },
              );
            }
          }

          return Center(child: CircularProgressIndicator());
        },
      ),

    );
  }


  Future getBusiness() async {
    var url = "businesses/getBusiness.php";
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    List<BusinessModel> arr = [];
    print("length:" + arr.length.toString());

    for (Map<String, dynamic> i in json.decode(response.body)) {
      print("i:" + i.toString());
      arr.add(BusinessModel.fromJson(i));
    }
    print("length:" + arr.length.toString());

    return arr;
  }
}
