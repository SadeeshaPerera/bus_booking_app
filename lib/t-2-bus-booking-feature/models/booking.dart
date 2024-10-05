import 'package:cloud_firestore/cloud_firestore.dart';

class Booking {
  String? bookingId;
  String? userId; // Could be linked to the user profile
  String? routeId; // Reference to the schedule route
  Timestamp? journeyDate; // Date the user selects for the journey (specific travel date)
  List<String>? selectedSeats; // List of seat numbers
  int? numberOfPassengers; // Must match selectedSeats length
  double? totalPrice; // Total price based on number of passengers (seats)
  Timestamp? createdAt;
  Timestamp? updatedAt;

  Booking({
    this.bookingId,
    this.userId,
    this.routeId,
    this.journeyDate,
    this.selectedSeats,
    this.numberOfPassengers,
    this.totalPrice,
    this.createdAt,
    this.updatedAt,
  });

  // To map the data to Firestore
  Map<String, dynamic> toMap() {
    return {
      'bookingId': bookingId,
      'userId': userId,
      'routeId': routeId,
      'journeyDate': journeyDate, // Selected travel date
      'selectedSeats': selectedSeats,
      'numberOfPassengers': numberOfPassengers,
      'totalPrice': totalPrice,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // From Firestore snapshot
  factory Booking.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Booking(
      bookingId: data['bookingId'],
      userId: data['userId'],
      routeId: data['routeId'],
      journeyDate: data['journeyDate'],
      selectedSeats: List<String>.from(data['selectedSeats']),
      numberOfPassengers: data['numberOfPassengers'],
      totalPrice: data['totalPrice'],
      createdAt: data['createdAt'],
      updatedAt: data['updatedAt'],
    );
  }
}
