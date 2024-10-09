import 'package:flutter/material.dart';

class CustomizeAlarmScreen extends StatelessWidget {
  const CustomizeAlarmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
          child: Text('Customize Alarm', style: TextStyle(color: Colors.white)),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: Image.asset('assets/images/round_dp.png').image,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text('Get Off Now', style: TextStyle(fontSize: 18))),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TimePickerColumn(),
                  SizedBox(width: 20),
                  TimePickerColumn(),
                  SizedBox(width: 20),
                  TimePickerColumn(isAmPm: true),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              title: const Text('Sound'),
              subtitle: const Text('Bluebird'),
              value: true,
              onChanged: (bool value) {},
            ),
            SwitchListTile(
              title: const Text('Vibrate'),
              value: true,
              onChanged: (bool value) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
            label: 'Tickets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.route),
            label: 'Routes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.announcement_outlined),
            label: 'Help',
          ),
        ],
      ),
    );
  }
}

class TimePickerColumn extends StatelessWidget {
  final bool isAmPm;

  const TimePickerColumn({super.key, this.isAmPm = false});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (isAmPm) {
              return Center(child: Text(index % 2 == 0 ? 'AM' : 'PM'));
            } else {
              return Center(child: Text(index.toString().padLeft(2, '0')));
            }
          },
          childCount: isAmPm ? 2 : 24,
        ),
      ),
    );
  }
}
