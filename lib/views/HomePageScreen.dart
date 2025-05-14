import 'package:cached_network_image/cached_network_image.dart';
import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import for JSON decoding
import 'package:finalproject/models/BusinessModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/clientConfig.dart';
import 'EventsScreen.dart'; // Ensure this import is correct for your BusinessModel class
import 'package:finalproject/main.dart'; // Ensure this import is correct for your BusinessModel class

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({super.key, required this.title});

  final String title;

  @override
  State<Homepagescreen> createState() => HomepagescreenPageState();
}

class HomepagescreenPageState extends State<Homepagescreen> {



  Future<void> openBussView(bussID, businessName) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lastBussID', bussID);
    print("bussID:" + bussID);
    // Handle onTap event here
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  BusinessDetailScreen(title: businessName!, bussID: bussID,)));
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade200,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: Text('My Events'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const EventsScreen(title: 'Events')),
                );
                // Navigate to Home
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                      MaterialPageRoute(builder: (context) => const EditProfileScreen(title: 'Edit Profile',)));
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),

              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Sign Up',)));
                // Do logout
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(

        children: [
          // Text "Halls" aligned to the left
          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Halls",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'Georgia'),
              ),
            ),
          ),

          // First FutureBuilder
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(6),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {

                                openBussView(project.businessID, project.businessName);

                              },
                              title:
                              Column(
                                children: [
                                  Text(
                                    project.businessName!,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    project.address.toString(),
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  CachedNetworkImage(
                                    width: 100,
                                    height: 60,
                                    placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                    imageUrl: project.imageURL,
                                  ),
                                ],
                              ),

                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),

          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "DJ",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(2),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),


          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Chef",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(8),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),

          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Make-Up Artist",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(4),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),


          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Photographer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(7),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),


          // Text "Decorations" aligned to the left
          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Decorations",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),

          // Second FutureBuilder
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(1),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),

          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Fruits",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(3),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),

          Align(
            alignment: Alignment.centerLeft, // Align text to the left
            child: Padding(
              padding: const EdgeInsets.all(8.0), // Optional padding for better spacing
              child: Text(
                "Sweets",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily:'Georgia'),
              ),
            ),
          ),
          FutureBuilder<List<BusinessModel>>(
            future: getBusiness(5),
            builder: (context, projectSnap) {
              if (projectSnap.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator(color: Colors.red));
              }

              if (projectSnap.hasError) {
                print(projectSnap.error);
                return Center(
                  child: Text(
                    "Error, try again.",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                );
              }

              if (projectSnap.hasData) {
                if (projectSnap.data!.isEmpty) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "No results.",
                        style: TextStyle(fontSize: 23, color: Colors.black),
                      ),
                    ),
                  );
                } else {
                  return Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: projectSnap.data!.length,
                      itemBuilder: (context, index) {
                        BusinessModel project = projectSnap.data![index];

                        return Card(
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width * 0.3,
                            margin: EdgeInsets.all(8.0),
                            child: ListTile(
                              enabled: true,
                              onTap: () {
                                openBussView(project.businessID, project.businessName);
                              },
                              title: Text(
                                project.businessName!,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              subtitle: Text(
                                project.address.toString(),
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              isThreeLine: false,
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              }

              return Center(
                child: CircularProgressIndicator(color: Colors.red),
              );
            },
          ),
        ],
      ),
      ),
    );
  }

  Future<List<BusinessModel>> getBusiness(businessTypeID) async {
    var url = "businesses/getBusiness.php?businessTypeID=" + businessTypeID.toString();
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);

    if (response.statusCode == 200) {
      List<BusinessModel> arr = [];
      for (Map<String, dynamic> i in json.decode(response.body)) {
        arr.add(BusinessModel.fromJson(i)); // Assuming BusinessModel has fromJson constructor
      }
      return arr;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
