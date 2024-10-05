import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We are here to help you!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            const Text(
              'Contact Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            // Phone Number
            ListTile(
              leading: const Icon(Icons.phone),
              title: const Text('+1 234 567 890'),
              onTap: () {
                // Call action
                _makePhoneCall('+1234567890');
              },
            ),
            const Divider(),
            // Email
            ListTile(
              leading: const Icon(Icons.email),
              title: const Text('support@busservice.com'),
              onTap: () {
                // Email action
                _sendEmail('support@busservice.com');
              },
            ),
            const Divider(),
            // Address
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text('123 Bus Station, City, Country'),
            ),
            const Divider(),
            // Website
            ListTile(
              leading: const Icon(Icons.web),
              title: const Text('www.busservice.com'),
              onTap: () {
                // Open website action
                _launchURL('https://www.busservice.com');
              },
            ),
          ],
        ),
      ),
    );
  }

  // Function to make a phone call
  void _makePhoneCall(String phoneNumber) async {
    // Implement your phone call functionality here
    // For example, using url_launcher package
  }

  // Function to send an email
  void _sendEmail(String email) async {
    // Implement your email functionality here
    // For example, using url_launcher package
  }

  // Function to launch a URL
  void _launchURL(String url) async {
    // Implement your URL launch functionality here
    // For example, using url_launcher package
  }
}
