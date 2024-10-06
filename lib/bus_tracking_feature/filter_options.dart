import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChipWidget(
            icon: Icons.departure_board_outlined,
            label: 'Departure time',
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.access_time,
            label: 'Arrival',
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.price_change_outlined,
            label: 'Price',
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.timer_outlined,
            label: 'Duration',
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.directions_bus_filled_outlined,
            label: 'Arrival Station',
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;

  const FilterChipWidget({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: Icon(icon, size: 20.0, color: Colors.black54),
      label: Text(label),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }
}
