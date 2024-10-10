import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // For date formatting
import 'seat_selection_page.dart';

class SelectPassengersPage extends StatefulWidget {
  final DateTime selectedDate;
  final String routeId; // Route ID passed from the previous page
  final double seatPrice; // Seat price passed from the previous page

  SelectPassengersPage({
    required this.selectedDate,
    required this.routeId,
    required this.seatPrice,});

  @override
  _SelectPassengersPageState createState() => _SelectPassengersPageState();
}

class _SelectPassengersPageState extends State<SelectPassengersPage> {
  int _passengerCount = 1; // Default number of passengers to 1

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Upper section with back arrow and title
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFF4A43EC), // Background color
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(30), // Rounded bottom corners
              ),
            ),
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
                  'Select Passengers',
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
          SizedBox(height: 10), // Space between cities and top
          // Route details and date section
          // Route details and date section
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.center, // Centering the items
                  children: [
                    Text(
                      'Galle',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    SizedBox(
                        width:
                            30), // Adjust this value to control the gap between Galle and the arrow
                    Icon(Icons.arrow_forward,
                        color: Colors.black.withOpacity(0.6), size: 30),
                    SizedBox(
                        width:
                            30), // Adjust this value to control the gap between arrow and Kandy
                    Text(
                      'Kandy',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10), // Space between cities and date
                Text(
                  '${DateFormat('d MMM - yyyy | EEEE').format(widget.selectedDate)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),

          // Time and duration section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '6.00 AM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF3B3B3B),
                  ),
                ),
                SizedBox(
                    width:
                        25), // Adjust this value to control the gap between Galle and the arrow
                Row(
                  children: [
                    Text(
                      '•',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 30,
                      child: Divider(
                          color: Colors.black.withOpacity(0.3), thickness: 1),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '5h',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      width: 30,
                      child: Divider(
                          color: Colors.black.withOpacity(0.3), thickness: 1),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '•',
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    width:
                        25), // Adjust this value to control the gap between Galle and the arrow
                Text(
                  '11.00 AM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF3B3B3B),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
              height: 60), // Add space between duration and passengers section

          // Passenger count section with a border
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: 10, horizontal: 20), // Padding inside the container
              decoration: BoxDecoration(
                border: Border.all(
                    color: Colors.grey.withOpacity(0.4),
                    width: 1.5), // Border as stroke
                borderRadius: BorderRadius.circular(15), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Passengers',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove_circle_outline,
                            color: Colors.grey),
                        onPressed: () {
                          if (_passengerCount > 1) {
                            setState(() {
                              _passengerCount--;
                            });
                          }
                        },
                      ),
                      Text(
                        '$_passengerCount',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add_circle_outline,
                            color: Color(0xFF5669FF)),
                        onPressed: () {
                          setState(() {
                            _passengerCount++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          Spacer(),

          // Select passengers button
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: SizedBox(
              width: double.infinity,
              height: 62,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeatSelectionPage(
                        selectedDate:
                            widget.selectedDate, // Pass the selected date
                        numberOfPassengers:
                            _passengerCount, // Pass the passenger count
                        routeId: widget.routeId, // Pass routeId to next page
                        seatPrice: widget.seatPrice, // Pass seatPrice to next page
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5669FF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  elevation: 8,
                ),
                child: Text(
                  'SELECT $_passengerCount PASSENGERS',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    letterSpacing: 2,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
