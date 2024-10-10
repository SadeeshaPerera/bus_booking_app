import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'view_ticket_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/models/booking.dart';

class ConfirmBookingPage extends StatefulWidget {
  final DateTime selectedDate;
  final List<String> selectedSeats;
  final double totalPrice;
  final String routeId; // Route ID passed from the previous page

  ConfirmBookingPage({
    required this.selectedDate,
    required this.selectedSeats,
    required this.totalPrice,
    required this.routeId,
  });

  @override
  _ConfirmBookingPageState createState() => _ConfirmBookingPageState();
}

class _ConfirmBookingPageState extends State<ConfirmBookingPage> {
  bool isConfirmed = false;

  @override
  void initState() {
    super.initState();

    // Debugging Prints to check passed values
    print("Received Selected Date: ${widget.selectedDate}");
    print("Received Selected Seats: ${widget.selectedSeats}");
    print("Received Total Price: ${widget.totalPrice}");
    print("Received Route ID: ${widget.routeId}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top blue part as Container
          Container(
            padding: EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
            decoration: BoxDecoration(
              color: Color(0xFF4A43EC),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Text(
                      'Confirm Booking',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 45), // Placeholder to center the title
                  ],
                ),
                //SizedBox(height: 2),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    DateFormat('d MMMM, EEEE').format(widget.selectedDate),
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          // Wrapping the remaining part of the layout inside Expanded
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Galle',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(width: 20),
                      Icon(Icons.arrow_forward,
                          color: Colors.black.withOpacity(0.6), size: 30),
                      SizedBox(width: 20),
                      Text(
                        'Kandy',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.grey.withOpacity(0.5), width: 2),
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '6:00 AM - 11:00 AM',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            Text('ND-3972', style: TextStyle(fontSize: 18)),
                            Text('One way',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'LKR ${widget.totalPrice}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF8C00),
                              ),
                            ),
                            SizedBox(height: 5),
                            Text('5 Hours',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.grey)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 20), // Padding inside the container
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.5), // Border as stroke
                        borderRadius:
                            BorderRadius.circular(15), // Rounded corners
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Selected Seats',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black.withOpacity(0.7)),
                          ),
                          Text(
                            widget.selectedSeats.join(', '),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment
                          .center, // Centers the row horizontally
                      children: [
                        Checkbox(
                          value: isConfirmed,
                          onChanged: (bool? value) {
                            setState(() {
                              isConfirmed = value ?? false;
                            });
                          },
                        ),
                        Text(
                          'I confirm my booking',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: ElevatedButton(
                      onPressed: isConfirmed
                          ? () async {
                              try {
                                // Create a new booking entry in Firestore and get the DocumentReference
                                DocumentReference bookingRef =
                                    await FirebaseFirestore.instance
                                        .collection('Booking')
                                        .add({
                                  'routeId': widget.routeId,
                                  'selectedDate':
                                      widget.selectedDate.toIso8601String(),
                                  'selectedSeats': widget.selectedSeats,
                                  'totalPrice': widget.totalPrice,
                                  'createdAt': DateTime.now()
                                      .toIso8601String(), // Current time
                                });

                                // Get the newly created booking ID
                                String bookingId = bookingRef.id;

                                // Show success message and redirect to View Ticket page
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text('Success'),
                                      content: Text(
                                          'Your booking has been confirmed!'),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(
                                                context); // Close the dialog
                                            // Navigate to ViewTicketPage with the bookingId and routeId
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    ViewTicketPage(
                                                  routeId: widget
                                                      .routeId, // Pass route ID to the next page
                                                  bookingId:
                                                      bookingId, // Pass the bookingId
                                                ),
                                              ),
                                            );
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } catch (error) {
                                // Handle error (e.g., if the Firestore operation fails)
                                print("Failed to add booking: $error");
                              }
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5669FF),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      child: Text(
                        'PROCEED',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          letterSpacing: 2,
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
}
