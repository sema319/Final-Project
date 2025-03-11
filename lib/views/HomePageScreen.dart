import 'package:finalproject/views/EditProfileScreen.dart';
import 'package:finalproject/views/BusinessDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // Import for JSON decoding
import 'package:finalproject/models/BusinessModel.dart';

import '../Utils/clientConfig.dart'; // Ensure this import is correct for your BusinessModel class

class Homepagescreen extends StatefulWidget {
  const Homepagescreen({super.key, required this.title});

  final String title;

  @override
  State<Homepagescreen> createState() => HomepagescreenPageState();
}

class HomepagescreenPageState extends State<Homepagescreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body:Row(
        children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Your Main Title Here', // Text that will appear at the top
            style: TextStyle(
              fontSize: 24,  // Adjust font size
              fontWeight: FontWeight.bold,  // Make the text bold
              color: Colors.black,  // Change color if needed
            ),
          ),
        ),


      Expanded(
        child: FutureBuilder<List<BusinessModel>>(

        future: getBusiness(),
        builder: (context, projectSnap) {
          if (projectSnap.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator(color: Colors.red));
          }

          if (projectSnap.hasError) {
            print(projectSnap.error);
            return Center(
              child: Text(
                'שגיאה, נסה שוב',
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
                    'אין תוצאות',
                    style: TextStyle(fontSize: 23, color: Colors.black),
                  ),
                ),
              );
            } else {
              return

                Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    child:
                    ListView.builder(

                scrollDirection: Axis.horizontal, // Set this to make it horizontal
                itemCount: projectSnap.data!.length,
                itemBuilder: (context, index) {
                  BusinessModel project = projectSnap.data![index];

                  return Card(

                    child: Container(
                      height: 200,
                      // width: 100,
                      width: MediaQuery.of(context).size.width * 0.3,  // Adjust width for each item
                      margin: EdgeInsets.all(8.0), // Space between items
                      child: ListTile(

                        enabled: true,
                        onTap: () {
                          // Handle onTap event here
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
                          project.capacity.toString(),
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
              )
                );
            }
          }

          return Center(
            child: CircularProgressIndicator(color: Colors.red),
          );
        },
      ),
      ),
    ],
      ),
    );
  }

  Future<List<BusinessModel>> getBusiness() async {
    var url = "businesses/getBusiness.php";
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);

    if (response.statusCode == 200) {
      List<BusinessModel> arr = [];
      for (Map<String, dynamic> i in json.decode(response.body)) {
        arr.add(BusinessModel.fromJson(i)); // Assuming BusinessModel has fromJson constructor
      }
      return arr;
    }
    else {
      throw Exception('Failed to load data');
    }
  }

}