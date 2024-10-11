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
          title: const Text('Missing Item'), 
          centerTitle: true,
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
              // Display image if available
              if (item['imageUrl'] != null && item['imageUrl']!.isNotEmpty)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    item['imageUrl']!,
                    height: 300, // Adjust height as needed
                    width: 300,
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),

              // Row for Title and isFound status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align title to left and isFound to right
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0), // Adjust padding for title section
                    child: Row(
                      children: [
                        const Icon(Icons.location_on, size: 24, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          item['title']!, // Display the original title
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (item['isFound'] != null)
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0), // Adjust right padding for isFound status
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white, // White background for outline effect
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 233, 232, 232),
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5), // Shadow color
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: const Offset(0, 3), // Position of the shadow
                            ),
                          ],
                        ),
                        child: Text(
                          item['isFound']!,
                          style: TextStyle(
                            color: item['isFound'] == 'Found' ? const Color.fromARGB(255, 252, 123, 4) : Colors.red, // Colored text
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 8),

              // Row for Date and isFound status
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align date to left and isFound to right
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, top: 8.0, bottom: 8.0), // Adjust padding as needed
                    child: Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20, color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(
                          'Date: ${item['date']}',
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Display item details
              Padding(
                padding: const EdgeInsets.only(left: 16.0), // Adjust the left padding as needed
                child: Text(
                  item['details']!,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),

              // Contact button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ContactScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF5669FF), // Set the button color to blue
                  foregroundColor: Colors.white,
                  minimumSize: const Size(180, 50), 
                ),
                child: const Text(
                  'Contact',
                  style: TextStyle(fontSize: 18),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
