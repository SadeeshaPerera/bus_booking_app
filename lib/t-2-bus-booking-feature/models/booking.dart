import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String? bookingId;
  String? routeId; // Reference to the schedule route
  Timestamp?
      selectedDate; // Date the user selects for the journey (specific travel date)
  List<String>? selectedSeats; // List of seat numbers
  double? totalPrice; // Total price based on number of passengers (seats)
  Timestamp? createdAt;

  Booking({
    this.bookingId,
    this.routeId,
    this.selectedDate,
    this.selectedSeats,
    this.totalPrice,
    this.createdAt,
  });

  // To map the data to Firestore
  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'routeId': routeId,
      'journeyDate': selectedDate, // Selected travel date
      'selectedSeats': selectedSeats,
      'totalPrice': totalPrice,
      'createdAt': createdAt,
    };
  }

  // From Firestore snapshot
  factory Booking.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Booking(
      bookingId: data['bookingId'],
      routeId: data['routeId'],
      selectedDate: data['journeyDate'],
      selectedSeats: List<String>.from(data['selectedSeats']),
      totalPrice: data['totalPrice'],
      createdAt: data['createdAt'],
    );
  }
}
