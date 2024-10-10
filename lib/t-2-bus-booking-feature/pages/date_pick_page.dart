import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart'; // For formatting dates
import 'select_passengers_page.dart'; // Import the page to navigate to
import 'package:bus_booking_app/t-2-bus-booking-feature/models/scheduleroute.dart'; // Import your model class
import 'package:cloud_firestore/cloud_firestore.dart';

class DatePickerPage extends StatefulWidget {
  final String routeId; // Route ID passed from the previous page
  final double seatPrice; // Seat price passed from the previous page

  DatePickerPage({
    required this.routeId,
    required this.seatPrice,
  });

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
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF4A43EC), // Background color for the upper part
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(25), // Rounded bottom corners
              ),
            ),
            padding: EdgeInsets.only(
                top: 50,
                left: 20,
                right: 20,
                bottom: 20), // Adjust top padding for status bar space
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                Text(
                  'Choose Date',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 48), // Placeholder to center the title
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TableCalendar(
                    firstDay: DateTime.utc(2020, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: _focusedDay,
                    calendarFormat: _calendarFormat,
                    selectedDayPredicate: (day) {
                      return isSameDay(_selectedDay, day);
                    },
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!_isDateAvailable(selectedDay)) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text("Selected date is not available!")),
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
                    calendarStyle: CalendarStyle(
                      selectedDecoration: BoxDecoration(
                        color: Color(0xFF5669FF),
                        shape: BoxShape.circle,
                      ),
                      todayDecoration: BoxDecoration(
                        color: Colors.blue.withOpacity(0.5),
                        shape: BoxShape.circle,
                      ),
                      markerDecoration: BoxDecoration(
                        color: Color(0xFF5669FF),
                        shape: BoxShape.circle,
                      ),
                      defaultDecoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                    headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleCentered: true,
                      headerPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                  SizedBox(height: 20), // Spacer for better layout
                  if (_selectedDay != null)
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16), // Only top and bottom padding
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Colors.black
                              .withOpacity(0.3), // Set the border color
                          width: 2, // Set the border width
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment:
                            MainAxisAlignment.center, // Center the content
                        children: [
                          Image.asset(
                            'assets/images/calendar.png', // Path to your calendar icon
                            width: 24, // Adjust width as needed
                            height: 24, // Adjust height as needed
                          ),
                          SizedBox(width: 10), // Space between icon and text
                          Text(
                            "${DateFormat('d').format(_selectedDay!)}${_getDaySuffix(DateFormat('d').format(_selectedDay!))} - ${DateFormat('MMM').format(_selectedDay!)} - ${DateFormat('y').format(_selectedDay!)} | ${DateFormat('EEEE').format(_selectedDay!)}",
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  Spacer(),
                  Center(
                    child: SizedBox(
                      width: 355, // Set the button width
                      height: 62, // Set the button height
                      child: ElevatedButton(
                        onPressed: () {
                          if (_selectedDay != null) {
                            // Add your logic to store selected date in booking collection
                            print("Selected Date: $_selectedDay");

                            // Navigate to the next page and pass seatPrice and routeId
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectPassengersPage(
                                  selectedDate: _selectedDay!,
                                  routeId: widget
                                      .routeId, // Pass routeId to next page
                                  seatPrice: widget
                                      .seatPrice, // Pass seatPrice to next page
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Please select a date!")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5669FF), // Button color
                          shadowColor:
                              Colors.black.withOpacity(0.2), // Subtle shadow
                          elevation: 8, // Button elevation for depth
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                40), // Match rounded edges
                          ),
                        ),
                        child: Text(
                          'CONFIRM',
                          style: TextStyle(
                            color: Colors.white, // White text color
                            fontWeight: FontWeight.bold, // Bold font
                            fontSize: 16, // Text size
                            letterSpacing:
                                2, // Spacing between letters to match style
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isDateAvailable(DateTime date) {
    DateTime now = DateTime.now();
    return !date.isBefore(now); // Ensure date is not in the past
  }

  String _getDaySuffix(String day) {
    int dayNumber = int.parse(day);
    if (dayNumber >= 11 && dayNumber <= 13)
      return "th"; // Special case for 11, 12, 13
    switch (dayNumber % 10) {
      case 1:
        return "st";
      case 2:
        return "nd";
      case 3:
        return "rd";
      default:
        return "th";
    }
  }
}
