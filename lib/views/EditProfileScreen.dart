import 'dart:convert';
import 'package:finalproject/models/UserModel.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Utils/Utils.dart';
import '../Utils/clientConfig.dart';
import 'package:http/http.dart' as http;



class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.title});



  final String title;

  @override
  State<EditProfileScreen> createState() => EditProfileScreenPageState();
}

late User _currUser;


class EditProfileScreenPageState extends State<EditProfileScreen> {
  bool _isLoading = true;
  final _txtUserID = new TextEditingController();
  final _txtFirstName = new TextEditingController();
  final _txtLastName = new TextEditingController();
  final _txtPhoneNumber = new TextEditingController();





  Future<void> getMyDetails() async {
    setState(() {
      _isLoading = true;
    });

    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userID = await prefs.get('token');
    var url = "users/getMyDetails.php?userID=" + userID.toString();
    final response = await http.get(Uri.parse(serverPath + url));
    print(serverPath + url);
    _currUser = User.fromJson(json.decode(response.body));

    setState(() {
      _isLoading = false;
    });
    _txtFirstName.text = _currUser.firstName;
    _txtLastName.text = _currUser.lastName;
    _txtPhoneNumber.text = _currUser.phoneNumber;

  }

  Future updateUser(BuildContext context, String firstName, String lastName, String phone) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var userID = await prefs.get('token');
    var url = "users/updateUser.php?userID=" + userID.toString()+ "&firstName=" + _txtFirstName.text + "&lastName=" + _txtLastName.text +
        "&phoneNumber=" + _txtPhoneNumber.text ;

    if(_txtFirstName.text != "" && _txtLastName.text != "" && _txtPhoneNumber.text != "" )
    {
      final response = await http.get(Uri.parse(serverPath + url));
      print(serverPath + url);

      await prefs.setString('firstName', _txtFirstName.text);
      await prefs.setString('lastName', _txtLastName.text);
      await prefs.setString('phoneNumber', _txtPhoneNumber.text);
      String? savedName = prefs.getString('firstName');
      String? savedlastName = prefs.getString('lastName');
      String? savedphoneNumber = prefs.getString('phoneNumber');
      savedName = prefs.getString('firstName');
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const EditProfileScreen(title: 'edit profile',))
      );
    }
    else
    {
      var uti = new Utils();
      uti.showMyDialog(context, "Required", "All fields are required.");
    }
  }



  @override
  Widget build(BuildContext context) {
    getMyDetails();

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(


          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[


            Text(
              "First Name*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(

              controller: _txtFirstName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your Name'),
            ),
            Text(
              "Last Name*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtLastName,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your Last Name'),
            ),

            Text(
              "PhoneNumber*:",
              style: TextStyle(fontSize: 20),
            ),
            TextField(
              controller: _txtPhoneNumber,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter your PhoneNumber'),
            ),

            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {

                updateUser(context,  _txtFirstName.text, _txtLastName.text, _txtPhoneNumber.text );
              },
              child: Text('Save Changes'),
            ),


          ],
        ),
      ),

    );
  }
}
