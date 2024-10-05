import 'package:bus_booking_app/Contact.dart';
import 'package:flutter/material.dart';

class MissingItemDetailScreen extends StatelessWidget {
  final Map<String, String> item;

  const MissingItemDetailScreen({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Use a container to define the height of the modal
      height: MediaQuery.of(context).size.height * 0.6, // Adjust height as needed
      child: Scaffold(
        appBar: AppBar(
          title: Text(item['title']!),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context); // Close the modal when the close button is pressed
            },
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item['details']!,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
                child: const Text('Contact'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
