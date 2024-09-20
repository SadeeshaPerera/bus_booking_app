import 'package:flutter/material.dart';

class NotificationPanelScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                NotificationCard(
                  title: 'Route 15A Delay',
                  subtitle: 'Expect delays near Central Ave. Buses delayed by 20 minutes.',
                  icon: Icons.warning,
                  time: '10 mins ago',
                  onTap: () {
                    // Handle the notification tap event
                  },
                ),
                NotificationCard(
                  title: 'Route 22B Accident',
                  subtitle: 'An accident occurred on the main highway.',
                  icon: Icons.error,
                  time: '30 mins ago',
                  onTap: () {
                    // Handle the notification tap event
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String time;
  final VoidCallback onTap;

  NotificationCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.time,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title),
        subtitle: Text(subtitle),
        trailing: Text(time),
        onTap: onTap,
      ),
    );
  }
}
