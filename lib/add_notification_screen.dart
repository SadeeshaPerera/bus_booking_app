import 'package:flutter/material.dart';

class AddNotificationScreen extends StatefulWidget {
  final Function(String, String, String, String) addNotificationCallback;

  AddNotificationScreen({required this.addNotificationCallback});

  @override
  _AddNotificationScreenState createState() => _AddNotificationScreenState();
}

class _AddNotificationScreenState extends State<AddNotificationScreen> {
  final _formKey = GlobalKey<FormState>();
  String? title;
  String? subtitle;
  String? icon;
  String? time;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Notification'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
                onSaved: (value) {
                  title = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Subtitle'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a subtitle';
                  }
                  return null;
                },
                onSaved: (value) {
                  subtitle = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Icon (warning/error)'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an icon type';
                  }
                  return null;
                },
                onSaved: (value) {
                  icon = value;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the time';
                  }
                  return null;
                },
                onSaved: (value) {
                  time = value;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    widget.addNotificationCallback(
                        title!, subtitle!, icon!, time!);
                    Navigator.pop(context); // Go back to Notification Panel
                  }
                },
                child: Text('Add Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
