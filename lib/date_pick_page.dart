import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Date'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              // Functionality to add return date or similar actions
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) async {
              if (!await _dateHasAvailableBuses(selectedDay)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("No buses available on this day!")),
                );
                return;
              }
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
          ),
          Spacer(),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(_selectedDay),
            child: Text('CONFIRM'),
          )
        ],
      ),
    );
  }

  Future<bool> _dateHasAvailableBuses(DateTime date) async {
    var dateStr = "${date.year}-${date.month}-${date.day}";
    var snapshot = await FirebaseFirestore.instance
        .collection('busSchedules')
        .where('date', isEqualTo: dateStr)
        .get();

    return snapshot.docs.isNotEmpty;
  }
}
