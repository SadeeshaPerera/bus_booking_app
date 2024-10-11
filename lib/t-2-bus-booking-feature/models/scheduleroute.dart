import 'package:flutter/material.dart'; // For TimeOfDay if you want to use this class
import 'package:cloud_firestore/cloud_firestore.dart';

class ScheduleRoute {
  String? routeId; 
  String? departureLocation; 
  String? destinationLocation;
  String? departureTime; // Store time as a string, e.g., "08:30 AM"
  String? destinationTime; // Store time as a string, e.g., "10:30 AM"
  double? seatPrice; // Price for one seat
  String? busNumber; 
  String? journeyDuration;

  ScheduleRoute({
    this.routeId,
    this.departureLocation,
    this.destinationLocation,
    this.departureTime,
    this.destinationTime,
    this.seatPrice,
    this.busNumber,
    this.journeyDuration,
  });

  // To map the data from Firestore
  Map<String, dynamic> toMap() {
    return {
      'routeId': routeId,
      'departureLocation': departureLocation,
      'destinationLocation': destinationLocation,
      'departureTime': departureTime,
      'destinationTime': destinationTime,
      'seatPrice': seatPrice,
      'busNumber': busNumber,
      'journeyDuration': journeyDuration,
    };
  }

  // From Firestore snapshot
  factory ScheduleRoute.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return ScheduleRoute(
      routeId: data['routeId'],
      departureLocation: data['departureLocation'],
      destinationLocation: data['destinationLocation'],
      departureTime: data['departureTime'],
      destinationTime: data['destinationTime'],
      seatPrice: (data['seatPrice'] as num).toDouble(),
      busNumber: data['busNumber'],
      journeyDuration: data['journeyDuration'],
    );
  }
}
