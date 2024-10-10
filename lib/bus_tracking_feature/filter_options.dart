import 'package:flutter/material.dart';

class FilterOptions extends StatelessWidget {
  final Function(String, String) onFilterSelected;

  const FilterOptions({super.key, required this.onFilterSelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          FilterChipWidget(
            icon: Icons.departure_board_outlined,
            label: 'Departure time',
            filterCriteria: 'departureTime',
            onSelected: onFilterSelected,
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.access_time,
            label: 'Arrival',
            filterCriteria: 'arrivalTime',
            onSelected: onFilterSelected,
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.price_change_outlined,
            label: 'Price',
            filterCriteria: 'price',
            onSelected: onFilterSelected,
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.timer_outlined,
            label: 'Duration',
            filterCriteria: 'duration',
            onSelected: onFilterSelected,
          ),
          SizedBox(width: 8.0), // Add spacing between the chips
          FilterChipWidget(
            icon: Icons.directions_bus_filled_outlined,
            label: 'Arrival Station',
            filterCriteria: 'endLocation',
            onSelected: onFilterSelected,
          ),
        ],
      ),
    );
  }
}

class FilterChipWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String filterCriteria;
  final Function(String, String) onSelected;

  const FilterChipWidget({
    super.key,
    required this.icon,
    required this.label,
    required this.filterCriteria,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(label, filterCriteria),
      child: Chip(
        avatar: Icon(icon, size: 20.0, color: Colors.black54),
        label: Text(label),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}
