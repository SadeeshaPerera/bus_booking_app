import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FilterChipWidget(
          icon: Icons.departure_board,
          label: 'Departure time',
        ),
        FilterChipWidget(
          icon: Icons.access_time,
          label: 'Arrival',
        ),
        FilterChipWidget(
          icon: Icons.price_change_outlined,
          label: 'Price',
        ),
        // Add more filters here as needed
      ],
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  FilterChipWidget({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 20.0, color: Colors.black54),
      label: Text(label),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
