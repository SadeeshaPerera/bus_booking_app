import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:bus_booking_app/bus_tracking_feature/bus_time_table_screen.dart';

class ViewTicketPage extends StatelessWidget {
  final String routeId; // Pass routeId to fetch ScheduleRoute data
  final String bookingId; // Pass bookingId to fetch Booking data

  ViewTicketPage({
    required this.routeId,
    required this.bookingId,
  });

  // Fetch schedule route data
  Future<DocumentSnapshot> getRouteData() async {
    return await FirebaseFirestore.instance
        .collection('ScheduleRoute')
        .doc(routeId)
        .get();
  }

  // Fetch booking data
  Future<DocumentSnapshot> getBookingData() async {
    return await FirebaseFirestore.instance
        .collection('Booking')
        .doc(bookingId)
        .get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: Future.wait([getRouteData(), getBookingData()]),
        builder: (context, AsyncSnapshot<List<DocumentSnapshot>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('No data available'));
          }

          var routeData = snapshot.data![0].data() as Map<String, dynamic>;
          var bookingData = snapshot.data![1].data() as Map<String, dynamic>;

          // Extracting necessary information
          String departureLocation = routeData['departureLocation'];
          String destinationLocation = routeData['destinationLocation'];
          String departureTime = routeData['departureTime'];
          String destinationTime = routeData['destinationTime'];
          String busNumber = routeData['busNumber'];
          String journeyDuration = routeData['journeyDuration'];

          DateTime selectedDate = DateTime.parse(bookingData['selectedDate']);
          List<String> selectedSeats =
              List<String>.from(bookingData['selectedSeats']);
          double totalPrice = bookingData['totalPrice'];
          DateTime createdAt = DateTime.parse(bookingData['createdAt']);

          return Column(
            children: [
              // Top Container
              Container(
                padding:
                    EdgeInsets.only(top: 40, left: 16, right: 16, bottom: 20),
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
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BusTimetableScreen(),
                              ),
                              (Route<dynamic> route) =>
                                  false, // Removes all previous routes
                            );
                          },
                        ),
                        Text(
                          'Ticket Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/round_dp.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Ticket Info Container
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 2),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.directions_bus,
                              size: 24, color: Colors.black),
                          Text(
                            '$busNumber',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 95),
                          Text(
                            DateFormat('EEE, dd MMM yyyy').format(selectedDate),
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.black54,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    departureTime,
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),
                                  Text(
                                    departureLocation,
                                    style: TextStyle(
                                        fontSize: 16, color: Colors.black54),
                                  ),
                                ],
                              ),
                            ],
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
                                width: 15,
                                child: Divider(
                                    color: Colors.black.withOpacity(0.3),
                                    thickness: 1),
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
                                width: 15,
                                child: Divider(
                                    color: Colors.black.withOpacity(0.3),
                                    thickness: 1),
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
                          Column(
                            children: [
                              Text(
                                destinationTime,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(width: 5),
                              Text(
                                destinationLocation,
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black54),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Text(
                                  'Selected Seats',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black),
                                ),
                              ]),
                              Row(children: [
                                Icon(Icons.airline_seat_recline_extra,
                                    size: 26, color: Colors.black54),
                                SizedBox(width: 8),
                                Text(
                                  '${selectedSeats.join(', ')}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ])
                            ],
                          ),
                          Text(
                            'LKR ${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF5669FF),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),

              // Booking details and QR code
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.grey.withOpacity(0.5), width: 2),
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BOOKING ID',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                            ),
                          ),
                          Text(
                            bookingId.toUpperCase(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Booking Date & Time',
                            style:
                                TextStyle(fontSize: 15, color: Colors.black54),
                          ),
                          Text(
                            DateFormat('EEE, dd MMM yyyy, hh:mm a')
                                .format(createdAt),
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),

                    


                      // QR Code using QRServer API
                      Image.network(
                        'https://api.qrserver.com/v1/create-qr-code/?size=150x150&data=$bookingId',
                        width: 50,
                        height: 50,

                      ),
                    ],
                  ),
                ),
              ),

              // Spacer(),

              SizedBox(height: 20),
              // Cancel button
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Show confirmation dialog
                      bool confirm = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Cancel Booking'),
                            content: Text(
                                'Are you sure you want to cancel the booking?'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(false); // User pressed 'No'
                                },
                                child: Text('No'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(true); // User pressed 'Yes'
                                },
                                child: Text('Yes'),
                              ),
                            ],
                          );
                        },
                      );

                      // If user confirms the cancellation
                      if (confirm) {
                        // Remove the document from the 'Booking' collection
                        await FirebaseFirestore.instance
                            .collection('Booking')
                            .doc(bookingId)
                            .delete();

                        // Navigate to the BusTimetableScreen (Home Page)
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BusTimetableScreen(),
                          ),
                          (Route<dynamic> route) =>
                              false, // This removes all previous routes
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF5669FF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: Text(
                      'CANCEL BOOKING',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Set active tab
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_num_outlined),
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
        selectedItemColor: Color(0xFF5669FF),
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
