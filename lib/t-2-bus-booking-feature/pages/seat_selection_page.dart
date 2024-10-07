import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'confirm_booking_page.dart';

class SeatSelectionPage extends StatefulWidget {
  final DateTime selectedDate;
  final int numberOfPassengers;

  SeatSelectionPage({
    required this.selectedDate,
    required this.numberOfPassengers,
  });

  @override
  _SeatSelectionPageState createState() => _SeatSelectionPageState();
}

class _SeatSelectionPageState extends State<SeatSelectionPage> {
  List<List<String>> seatGrid = [
    ['booked', 'available', 'available', 'available'], // row 1
    ['available', 'available', 'booked', 'booked'], // row 2
    ['available', 'available', 'available', 'available'], // row 3
    ['booked', 'available', 'available', 'available'], // row 4
    ['available', 'booked', 'available', 'available'], // row 5
    ['available', 'available', 'available', 'booked'], // row 6
  ];

  List<List<bool>> selectedSeats = List.generate(
    6,
    (index) => List.generate(4, (index) => false),
  );

  int selectedSeatCount = 0;
  List<String> selectedSeatIdentifiers = []; // List to store seat identifiers

  void onSeatTapped(int rowIndex, int colIndex) {
    if (seatGrid[rowIndex][colIndex] == 'available' &&
        (selectedSeatCount < widget.numberOfPassengers ||
            selectedSeats[rowIndex][colIndex])) {
      setState(() {
        selectedSeats[rowIndex][colIndex] = !selectedSeats[rowIndex][colIndex];

        String seatIdentifier =
            '${rowIndex + 1}${String.fromCharCode(65 + colIndex)}';

        if (selectedSeats[rowIndex][colIndex]) {
          selectedSeatCount++;
          selectedSeatIdentifiers.add(seatIdentifier);
        } else {
          selectedSeatCount--;
          selectedSeatIdentifiers.remove(seatIdentifier);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(top: 50, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Color(0xFF4A43EC),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
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
                    'Choose your seat!',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 40),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 15.0, horizontal: 16.0),
              child: Column(
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
                  Text(
                    '${DateFormat('d MMM - yyyy | EEEE').format(widget.selectedDate)}',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0), // Add horizontal padding
              child: Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 14.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border:
                      Border.all(color: Colors.grey.withOpacity(0.5), width: 2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: '6:00 AM',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                              TextSpan(
                                text: ' – ',
                                style:
                                    TextStyle(fontSize: 20, color: Colors.grey),
                              ),
                              TextSpan(
                                text: '11:00 AM',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 6),
                        Text('ND-3972',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                        Text('One way',
                            style: TextStyle(fontSize: 16, color: Colors.grey)),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          'LKR 2000',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF8C00),
                          ),
                        ),
                        SizedBox(height: 5),
                        Text('5 Hours',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    // Seat Status Legend
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildLegend('Booked', Colors.red),
                        SizedBox(width: 25),
                        _buildLegend('Available', Colors.grey[300]!),
                        SizedBox(width: 25),
                        _buildLegend('Your Seat', Colors.blue),
                      ],
                    ),
                    SizedBox(height: 30),
                    // Column Labels A, B, C, D
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildColumnLabel('A'),
                        SizedBox(width: 28),
                        _buildColumnLabel('B'),
                        SizedBox(width: 68), // Aisle space
                        _buildColumnLabel('C'),
                        SizedBox(width: 28),
                        _buildColumnLabel('D'),
                      ],
                    ),
                    SizedBox(height: 10),
                    // Seat Rows
                    Column(
                      children: List.generate(6, (rowIndex) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (colIndex) {
                            String status = seatGrid[rowIndex][colIndex];
                            bool isSelected = selectedSeats[rowIndex][colIndex];
                            return Padding(
                              padding: EdgeInsets.only(
                                left: 10.0,
                                right: colIndex == 1 ? 60.0 : 10.0,
                                top: 10.0,
                                bottom: 10.0,
                              ),
                              child: GestureDetector(
                                onTap: () => onSeatTapped(rowIndex, colIndex),
                                child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.blue
                                        : status == 'available'
                                            ? Colors.grey[300]
                                            : Colors.red,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                              ),
                            );
                          }),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 62,
                child: ElevatedButton(
                  onPressed: selectedSeatCount == widget.numberOfPassengers
                      ? () {
                          // Proceed with the seat selection
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ConfirmBookingPage(
                                selectedSeats: selectedSeatIdentifiers,
                              ),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF5669FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                    elevation: 8,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLegend(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 4),
        Text(label, style: TextStyle(fontSize: 16)),
      ],
    );
  }

  Widget _buildColumnLabel(String label) {
    return Container(
      width: 40,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }
}
