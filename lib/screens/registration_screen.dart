import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController referralController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Let's Begin!"),
            SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Your Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Create Password'),
              obscureText: true,
            ),
            TextField(
              controller: referralController,
              decoration: InputDecoration(labelText: 'Referral Code (Optional)'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                String email = emailController.text;
                String password = passwordController.text;
                int referralCode = int.tryParse(referralController.text) ?? 0; // If referral code is optional
                String userId = "12345"; // Replace with actual user ID
                await registerUser(email, password, referralCode, userId);
              },
              child: Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> registerUser(String email, String password, int referralCode, String userId) async {
    var url = Uri.parse('http://devapiv4.dealsdray.com/api/v2/user/email/referral');
    
    Map<String, dynamic> data = {
      "email": email,
      "password": password,
      "referralCode": referralCode,
      "userId": userId,
    };

    var response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print('User registered successfully');
    } else {
      print('Failed to register user: ${response.statusCode}');
    }
  }
}