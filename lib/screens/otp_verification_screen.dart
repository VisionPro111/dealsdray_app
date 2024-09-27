import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OtpVerificationScreen extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('OTP Verification'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("OTP Verification"),
            SizedBox(height: 8),
            Text("We have sent a unique OTP number to your mobile"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    controller: otpController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                );
              }),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("01:57"),
                TextButton(
                  onPressed: () {
                    // Resend OTP Logic (if necessary)
                  },
                  child: Text('Send Again'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                String otp = otpController.text;
                String deviceId = "C6179909526098"; // Example device ID
                String userId = "12345"; // Replace with actual user ID
                await verifyOtp(otp, deviceId, userId);
              },
              child: Text('Verify OTP'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> verifyOtp(String otp, String deviceId, String userId) async {
    var url = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/otp/verification');
    
    Map<String, dynamic> data = {
      "otp": otp,
      "deviceId": deviceId,
      "userId": userId,
    };

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('OTP verified successfully');
    } else {
      print('Failed to verify OTP: ${response.statusCode}');
    }
  }
}