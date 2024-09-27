import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatelessWidget {
  final TextEditingController mobileController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('DealsDray'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Glad to see you!", style: TextStyle(fontSize: 24)),
            SizedBox(height: 8),
            Text("Please provide your phone number"),
            TextField(
              controller: mobileController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String mobileNumber = mobileController.text;
                String deviceId = "C6179909526098"; // Example device ID, replace as necessary
                await requestOtp(mobileNumber, deviceId);
                Navigator.pushNamed(context, '/otp');
              },
              child: Text('Send Code'),
              style: ElevatedButton.styleFrom(primary: Colors.pink),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> requestOtp(String mobileNumber, String deviceId) async {
    var url = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp');
    
    Map<String, dynamic> data = {
      "mobileNumber": mobileNumber,
      "deviceId": deviceId,
    };

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('OTP requested successfully');
    } else {
      print('Failed to request OTP: ${response.statusCode}');
    }
  }
}