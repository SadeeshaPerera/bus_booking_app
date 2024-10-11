import 'package:flutter/material.dart';

class CustomizeAlarmScreen extends StatefulWidget {
  const CustomizeAlarmScreen({super.key});

  @override
  _CustomizeAlarmScreenState createState() => _CustomizeAlarmScreenState();
}

class _CustomizeAlarmScreenState extends State<CustomizeAlarmScreen> {
  bool _isVibrateEnabled = true;
  double _volume = 0.5;

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
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: CircleAvatar(
              backgroundImage: Image.asset('assets/images/round_dp.png').image,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
                child: Text('Get Off Now',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
            const SizedBox(height: 60),
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
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Alarm Sound',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Bluebird',
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Volume',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Slider(
              value: _volume,
              onChanged: (double value) {
                setState(() {
                  _volume = value;
                });
              },
              min: 0,
              max: 1,
              divisions: 10,
              label: (_volume * 100).round().toString(),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Vibrate',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Switch(
                  value: _isVibrateEnabled,
                  onChanged: (bool value) {
                    setState(() {
                      _isVibrateEnabled = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Preview Alarm',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: () {
                    // Implement preview alarm functionality here
                  },
                ),
              ],
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

class TimePickerColumn extends StatefulWidget {
  final bool isAmPm;

  const TimePickerColumn({super.key, this.isAmPm = false});

  @override
  _TimePickerColumnState createState() => _TimePickerColumnState();
}

class _TimePickerColumnState extends State<TimePickerColumn> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 60,
      child: ListWheelScrollView.useDelegate(
        itemExtent: 50,
        perspective: 0.005,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final isSelected = index == _selectedIndex;
            final textStyle = isSelected
                ? const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)
                : const TextStyle(fontSize: 16);

            if (widget.isAmPm) {
              return Center(
                child: Text(
                  index % 2 == 0 ? 'AM' : 'PM',
                  style: textStyle,
                ),
              );
            } else {
              return Center(
                child: Text(
                  index.toString().padLeft(2, '0'),
                  style: textStyle,
                ),
              );
            }
          },
          childCount: widget.isAmPm ? 2 : 24,
        ),
      ),
    );
  }
}
