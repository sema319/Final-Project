// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import '../Utils/clientConfig.dart';
//
// class eventsScreen extends StatefulWidget {
//   const eventsScreen({super.key, required this.title});
//
//   final String title;
//
//   @override
//   State<eventsScreen> createState() => eventsScreenPageState();
// }
//
// class eventsScreenPageState extends State<eventsScreen> {
//   Future getMyLocations() async {
//
//
//     var url = "users/getDetailsHours.php";
//     final response = await http.get(Uri.parse(serverPath + url));
//     print(serverPath + url);
//     List<WorkLogModel> arr = [];
//
//
//     for(Map<String, dynamic> i in json.decode(response.body)){
//       arr.add(WorkLogModel.fromJson(i));
//     }
//
//
//     return arr;
//   }
//   factory WorkLogModel.fromJson(Map<String, dynamic> json) {
//
//
//     return WorkLogModel(
//       date: json['date'],
//       ariveHour: json['ariveHour'],
//       exitHour: json['exitHour'],
//       totalHours: json['totalHours'],
//       comments: json['comments'],
//     );
//   }
//
//
//
// }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: FutureBuilder(
//           future: getMyLocations(),
//           builder: (context, projectSnap) {
//             if (projectSnap.hasData) {
//               if (projectSnap.data.length == 0) {
//                 return SizedBox(
//                   height: MediaQuery
//                       .of(context)
//                       .size
//                       .height * 2,
//                   child: Align(
//                       alignment: Alignment.center,
//                       child: Text('אין תוצאות',
//                           style: TextStyle(fontSize: 23, color: Colors.black))
//                   ),
//                 );
//               }
//               else {
//                 return Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: <Widget>[
//
//
//                     Expanded(
//                         child: ListView.builder(
//                           itemCount: projectSnap.data.length,
//                           itemBuilder: (context, index) {
//                             WorkLogModel project = projectSnap.data[index];
//
//
//                             return Card(
//                                 child: ListTile(
//                                   onTap: () {
//
//
//                                   },
//                                   title: Text(project.date!, style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black),),
//                                   // Icon(Icons.timer),
//                                   subtitle: Text(
//                                     "[" + project.ariveHour! + "-" +
//                                         project.exitHour! + "]" + "\n" +
//                                         project.comments!, style: TextStyle(
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                       color: Colors.black),),
//                                   trailing: Container(
//                                     decoration: const BoxDecoration(
//                                       color: Colors.blue,
//                                       borderRadius: BorderRadius.all(
//                                           Radius.circular(5)),
//                                     ),
//                                     padding: const EdgeInsets.symmetric(
//                                       horizontal: 12,
//                                       vertical: 4,
//                                     ),
//                                     child: Text(
//                                       project.totalHours!, // + "שעות "
//                                       overflow: TextOverflow.ellipsis,
//                                       style: TextStyle(fontSize: 16,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.white),
//                                     ),
//                                   ),
//
//
//                                   isThreeLine: false,
//                                 ));
//                           },
//                         )),
//                   ],
//                 );
//               }
//             }
//             else if (projectSnap.hasError) {
//               print("error:" + projectSnap.error.toString());
//               return Center(child: Text('שגיאה, נסה שוב',
//                   style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)));
//             }
//             return Center(
//                 child: new CircularProgressIndicator(color: Colors.red,));
//           },
//         )
//     );
//   }
//
//
