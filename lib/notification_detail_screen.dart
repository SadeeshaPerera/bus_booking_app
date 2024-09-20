import 'package:flutter/material.dart';

class NotificationDetailScreen extends StatelessWidget {
  final String title;

  NotificationDetailScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Text('Details for $title'),
      ),
    );
  }
}
