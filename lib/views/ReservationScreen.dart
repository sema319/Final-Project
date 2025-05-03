import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart'; // Added for proper date formatting

import '../Utils/Utils.dart';
import '../Utils/clientConfig.dart';
import 'HomePageScreen.dart';

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
  bool isLoading = false;
  bool isAvailabilityChecked = false;
  bool isDateAvailable = false;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        isAvailabilityChecked = false; // Reset availability check when date changes
      });
      // Check availability automatically when a date is selected
      await checkAvailability();
    }
  }

  Future<void> checkAvailability() async {
    if (selectedDate == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('يرجى اختيار تاريخ أولاً')));
      return;
    }

    setState(() {
      isLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var bussID = await prefs.getString('lastBussID');

    if (bussID == null) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('يرجى تسجيل الدخول أولاً')));
      return;
    }

    // Format date properly using DateFormat
    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    try {
      var checkUrl = "events/checkDate.php?bussID=$bussID&date=$formattedDate";

      print("Checking availability URL: ${serverPath + checkUrl}");

      final checkResponse = await http.get(Uri.parse(serverPath + checkUrl));

      print("Response status: ${checkResponse.statusCode}");
      print("Response body: ${checkResponse.body}");

      setState(() {
        isLoading = false;
        isAvailabilityChecked = true;
      });

      if (checkResponse.statusCode == 200) {
        try {
          var jsonResponse = jsonDecode(checkResponse.body);
          setState(() {
            isDateAvailable = jsonResponse['result'] == '1';
          });

          if (isDateAvailable) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('التاريخ متاح للحجز')));
          } else {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('هذا التاريخ محجوز بالفعل')));
          }
        } catch (e) {
          print("JSON parsing error: $e");
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('خطأ في معالجة البيانات')));
        }
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('خطأ في الاتصال بالخادم')));
      }
    } catch (e) {
      print("Check availability error: $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('خطأ في الاتصال بالخادم')));
    }
  }

  Future<void> saveEvent(BuildContext context) async {
    if (selectedDate == null) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('يرجى اختيار تاريخ أولاً')));
      return;
    }

    // If availability hasn't been checked yet, check it first
    if (!isAvailabilityChecked) {
      await checkAvailability();
      // Return if it was just checked and not available
      if (!isDateAvailable) return;
    } else if (!isDateAvailable) {
      // If we already know it's not available, show message and return
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('هذا التاريخ محجوز بالفعل')));
      return;
    }

    setState(() {
      isLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var bussID = await prefs.getString('lastBussID');
    var userID = await prefs.getString('token');

    if (bussID == null || userID == null) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('يرجى تسجيل الدخول أولاً')));
      return;
    }

    // Format date properly using DateFormat
    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate!);

    try {
      var bookUrl =
          "events/insertEvent.php?bussID=$bussID&date=$formattedDate&userID=$userID";

      print("Booking URL: ${serverPath + bookUrl}");

      try {
        final bookResponse = await http.get(Uri.parse(serverPath + bookUrl));

        print("Response status: ${bookResponse.statusCode}");
        print("Response body: ${bookResponse.body}");

        setState(() {
          isLoading = false;
        });

        if (bookResponse.statusCode == 200) {
          try {
            var jsonResponse = jsonDecode(bookResponse.body);

            if (jsonResponse['result'] == '1') {
              // Show success message
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('تم الحجز بنجاح')));

              // Navigate to home page
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                      const Homepagescreen(title: 'Home Page')));
            } else {
              // Show specific error message if available
              String errorMessage = jsonResponse['message'] ?? 'حدث خطأ أثناء الحجز';
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(errorMessage)));
            }
          } catch (e) {
            print("JSON parsing error: $e");
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text('خطأ في معالجة البيانات')));
          }
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('خطأ في الاتصال بالخادم')));
        }
      } catch (e) {
        print("HTTP error: $e");
        setState(() {
          isLoading = false;
        });
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('خطأ في الاتصال بالخادم')));
      }
    } catch (e) {
      print("General error: $e");
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('حدث خطأ غير متوقع')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          selectedDate != null
              ? DateFormat('dd/MM/yyyy').format(selectedDate!)
              : 'No date selected',
        ),
        const SizedBox(height: 20),
        OutlinedButton(
            onPressed: _selectDate, child: const Text('Select Date')),
        const SizedBox(height: 20),
        if (isAvailabilityChecked && selectedDate != null)
          Container(
            padding: const EdgeInsets.all(8),
            color: isDateAvailable ? Colors.green[100] : Colors.red[100],
            child: Text(
              isDateAvailable ? 'is Avaiable' : 'is not Avaiable',
              style: TextStyle(
                color: isDateAvailable ? Colors.green[800] : Colors.red[800],
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        const SizedBox(height: 20),
        isLoading
            ? const CircularProgressIndicator()
            : TextButton(
          style: ButtonStyle(
            foregroundColor:
            MaterialStateProperty.all<Color>(Colors.white),
            backgroundColor: MaterialStateProperty.all<Color>(
                isDateAvailable ? Colors.blue : Colors.grey),
            padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 30, vertical: 15)),
          ),
          onPressed: isDateAvailable ? () => saveEvent(context) : null,
          child: const Text('Save My Event'),
        ),
      ],
    );
  }
}