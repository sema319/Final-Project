import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:finalproject/models/BusinessModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/clientConfig.dart';
import '../models/EventsModel.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key, required this.title});

  final String title;

  @override
  State<EventsScreen> createState() => EventsScreenPageState();
}


class EventsScreenPageState extends State<EventsScreen> {
  Future<List<WorkLogModel>> getMyLocations() async {
    var url = "users/getDetailsHours.php";
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    List<WorkLogModel> arr = [];

    for (Map<String, dynamic> i in json.decode(response.body)) {
      arr.add(WorkLogModel.fromJson(i));
    }

    return arr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getMyLocations(),
        builder: (context, projectSnap) {
          if (projectSnap.hasData) {
            if (projectSnap.data!.isEmpty) {
              return SizedBox(
                height: MediaQuery.of(context).size.height * 2,
                child: Align(
                  alignment: Alignment.center,
                  child: Text('אין תוצאות',
                      style: TextStyle(fontSize: 23, color: Colors.black)),
                ),
              );
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: ListView.builder(
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        WorkLogModel project = projectSnap.data![index];

                        return Card(
                          child: ListTile(
                            onTap: () {},
                            title: Text(
                              project.date ?? '',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            subtitle: Text(
                              "[${project.ariveHour ?? ''}-${project.exitHour ?? ''}]\n${project.comments ?? ''}",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            trailing: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                                borderRadius:
                                BorderRadius.all(Radius.circular(5)),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 4,
                              ),
                              child: Text(
                                project.totalHours ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            isThreeLine: false,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          } else if (projectSnap.hasError) {
            print("error:" + projectSnap.error.toString());
            return Center(
              child: Text('שגיאה, נסה שוב',
                  style: TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold)),
            );
          }
          return Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        },
      ),
    );
  }
}
