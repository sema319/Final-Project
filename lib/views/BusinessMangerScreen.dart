import 'dart:convert';

import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:finalproject/views/ReservationDetailScreen.dart';
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
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: FutureBuilder(
          future: getBusiness(),
          builder: (context, projectSnap) {
            if (projectSnap.hasData) {
              if (projectSnap.data.length == 0) {
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 2,
                  child: Align(
                      alignment: Alignment.center,
                      child: Text('אין תוצאות',
                          style: TextStyle(fontSize: 23, color: Colors.black))),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                        child: ListView.builder(
                      itemCount: projectSnap.data.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data[index];

                        return Card(
                            child: ListTile(
                          enabled: false,
                          onTap: () {},
                          title: Text(
                            project.businessName!,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ), // Icon(Icons.timer),
                          subtitle: Text(
                            project.capacity.toString(),
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          /*
                                  trailing: Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                      vertical: 4,
                                    ),
                                    child: Text(
                                      project.address!,   // + "שעות "
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
                                    ),
                                  ),
*/

                          isThreeLine: false,
                        ));
                      },
                    )),
                  ],
                );
              }
            } else if (projectSnap.hasError) {
              print(projectSnap.error);
              return Center(
                  child: Text('שגיאה, נסה שוב',
                      style: TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold)));
            }
            return Center(
                child: new CircularProgressIndicator(
              color: Colors.red,
            ));
          },
        ));
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
