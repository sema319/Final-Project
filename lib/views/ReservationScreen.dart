import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Utils.dart';
import '../Utils/clientConfig.dart';
import 'HomePageScreen.dart';

/// Flutter code sample for basic [showDatePicker].

class ReservationScreen extends StatefulWidget {
  const ReservationScreen({super.key, required this.title});

  final String title;

  @override
  State<ReservationScreen> createState() => ReservationScreenPageState();
}


class ReservationScreenPageState extends State<ReservationScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Reservation Screen')),
        body: const Center(child: DatePickerExample()),
      ),
    );
  }
}


class DatePickerExample extends StatefulWidget {
  const DatePickerExample({super.key});

  @override
  State<DatePickerExample> createState() => _DatePickerExampleState();
}


class _DatePickerExampleState extends State<DatePickerExample> {
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2050),
    );

    setState(() {
      selectedDate = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {


    Future inserEvent(BuildContext context) async {

      final SharedPreferences prefs = await SharedPreferences.getInstance();
      var bussID = await prefs.getString('lastBussID');
      var userID = await prefs.getString('token');

      var url = "events/insertEvent.php?bussID=" + bussID! + "&date=" + "&userID=" + userID!;
      final response = await http.get(Uri.parse(serverPath + url));
      print(serverPath + url);
      // setState(() { });
      // Navigator.pop(context);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Homepagescreen(title: 'Home Page',))
      );
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          selectedDate != null
              ? '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}'
              // ? '${selectedDate!.year}-${selectedDate!.month}-${selectedDate!.day}'

              : 'No date selected',
        ),
        const SizedBox(height: 20), // Added spacing here instead of using spacing: 20
        OutlinedButton(onPressed: _selectDate, child: const Text('Select Date')),


        TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () {

            inserEvent(context);
          },
          child: Text('Save My Event'),
        ),

      ],
    );
  }
}


