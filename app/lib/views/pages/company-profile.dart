import 'package:flutter/material.dart';

class CompanyProfileScreen extends StatelessWidget {
  final String companyName;
  final String companyDescription;
  final String companyAddress;
  final String companyEmail;
  final String companyPhoneNumber;
  final String companyLogoUrl;

  CompanyProfileScreen({
    required this.companyName,
    required this.companyDescription,
    required this.companyAddress,
    required this.companyEmail,
    required this.companyPhoneNumber,
    required this.companyLogoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Profile'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              companyLogoUrl,
              height: 150.0,
              width: 150.0,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 16.0),
            Text(
              companyName,
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              companyDescription,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Address:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              companyAddress,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Email:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              companyEmail,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Phone Number:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              companyPhoneNumber,
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}

