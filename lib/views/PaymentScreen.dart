import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.title});

  final String title;

  @override
  State<PaymentScreen> createState() => PaymentScreenPageState();
}

class PaymentScreenPageState extends State<PaymentScreen> {
  // متغيرات لتخزين بيانات البطاقة
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController cardHolderController = TextEditingController();
  final TextEditingController expiryDateController = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              "To confirm the reservation, a deposit is required.",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
              ),
              onPressed: () {
                _showCreditCardDialog(context);
              },
              child: Text('Credit Card'),
            ),
          ],
        ),
      ),
    );
  }

  // دالة عرض نافذة إدخال بيانات البطاقة الائتمانية
  void _showCreditCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Enter Credit Card Details"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: cardNumberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Card Number",
                  hintText: "1234 5678 9012 3456",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cardHolderController,
                decoration: InputDecoration(
                  labelText: "Cardholder Name",
                  hintText: "John Doe",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: expiryDateController,
                keyboardType: TextInputType.datetime,
                decoration: InputDecoration(
                  labelText: "Expiration Date",
                  hintText: "MM/YY",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cvvController,
                keyboardType: TextInputType.number,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "CVV",
                  hintText: "***",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text("Cancel"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: Text("Submit"),
              onPressed: () {
                _processPayment();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  // دالة لتنفيذ عملية الدفع (مؤقتة)
  void _processPayment() {
    print("Processing Payment...");
    print("Card Number: ${cardNumberController.text}");
    print("Cardholder Name: ${cardHolderController.text}");
    print("Expiration Date: ${expiryDateController.text}");
    print("CVV: ${cvvController.text}");
  }
}
