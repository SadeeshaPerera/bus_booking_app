import 'package:flutter/material.dart';

class CriticalNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Critical Notification'),
      ),
      body: Center(
        child: Text('Details about the critical notification.'),
      ),
    );
  }
}
