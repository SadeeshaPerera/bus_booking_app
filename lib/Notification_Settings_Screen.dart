import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  @override
  _NotificationSettingsScreenState createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  bool busDelays = true;
  bool busAccidents = true;
  bool onTimeBuses = true;
  double frequency = 0.5;
  bool receiveCriticalAlerts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notification Settings'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customize Notifications', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Notification Types', style: TextStyle(fontSize: 16)),
            CheckboxListTile(
              title: Text('Bus Delays'),
              value: busDelays,
              onChanged: (value) {
                setState(() {
                  busDelays = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Bus Accidents'),
              value: busAccidents,
              onChanged: (value) {
                setState(() {
                  busAccidents = value ?? false;
                });
              },
            ),
            CheckboxListTile(
              title: Text('On-Time Buses'),
              value: onTimeBuses,
              onChanged: (value) {
                setState(() {
                  onTimeBuses = value ?? false;
                });
              },
            ),
            SizedBox(height: 20),
            Text('Notification Frequency', style: TextStyle(fontSize: 16)),
            Slider(
              value: frequency,
              onChanged: (newFrequency) {
                setState(() {
                  frequency = newFrequency;
                });
              },
              min: 0,
              max: 1,
              divisions: 10, // Optional: divide the slider into segments
              label: '${(frequency * 100).round()}%', // Show frequency label
            ),
            SizedBox(height: 20),
            Text('Critical Notifications', style: TextStyle(fontSize: 16)),
            SwitchListTile(
              title: Text('Receive Critical Alerts'),
              value: receiveCriticalAlerts,
              onChanged: (value) {
                setState(() {
                  receiveCriticalAlerts = value;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save settings action
                // Here you can implement the logic to save settings
              },
              child: Text('Save Settings'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Updated to use backgroundColor
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
