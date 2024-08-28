import 'package:flutter/material.dart';

class VerificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Enter your 4-digit code',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '- - - -',
                border: OutlineInputBorder(),
              ),
              maxLength: 4,
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Verification functionality
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:  Colors.green, // Button color
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              ),
              child: Icon(Icons.arrow_forward),
            ),
            TextButton(
              onPressed: () {
                // Resend Code functionality
              },
              child: Text('Resend Code'),
            ),
          ],
        ),
      ),
    );
  }
}
