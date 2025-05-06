import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../Utils/clientConfig.dart';
import '../models/EventsModel.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key, required this.title});

  final String title;

  @override
  State<EventsScreen> createState() => EventsScreenPageState();
}

class EventsScreenPageState extends State<EventsScreen> {
  Future<List<EventModel>> getMyEvents() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userID = await prefs.getString('token');

    var url = "events/getMyEvents.php?userID=" + userID!;
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    List<EventModel> arr = [];

    for (Map<String, dynamic> i in json.decode(response.body)) {
      arr.add(EventModel.fromJson(i));
    }

    return arr;
  }

  Future deleteEvent(BuildContext context, String eventID) async {
    var url = "events/deleteEvent.php?eventID=" + eventID;
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: getMyEvents(),
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
                        EventModel event = projectSnap.data![index];

                        return Card(
                          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            contentPadding: EdgeInsets.all(16),
                            onTap: () {},
                            title: Text(
                              event.date ?? 'No Date',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            subtitle: Text(
                              "Event ID: ${event.eventID ?? ''} | Business Name: ${event.bussID ?? ''}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[700],
                              ),
                            ),
                            trailing: IconButton(
                              icon: Icon(Icons.delete, color: Colors.red, size: 28),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("Cancel Reservation"),
                                      content: Text("Are you sure you want to cancel this reservation?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // No
                                          },
                                          child: Text("No", style: TextStyle(color: Colors.black)),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop(); // Close dialog
                                            deleteEvent(context, event.eventID!); // Perform deletion
                                          },
                                          child: Text("Yes", style: TextStyle(color: Colors.red)),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
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