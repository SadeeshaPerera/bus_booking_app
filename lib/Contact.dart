import 'package:flutter/material.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0), // Adjust height as needed
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)), // Rounded corners
          child: AppBar(
            backgroundColor: Color(0xFF4A43EC), // Blue background for the AppBar
            foregroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 20.0), // Adjust left and top padding for the back button
              child: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context); // Navigate back
                },
              ),
            ),
            title: Padding(
              padding: const EdgeInsets.only(top: 20.0), // Adjust top padding for the title
              child: const Text(
                'Contact',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ), 
              ),
            ),
            centerTitle: true, // Center the title
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0, top: 20.0), // Adjust right and top padding for the avatar
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/round_dp.png'), // Profile image
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView( // Allow scrolling if content is too long
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // Make content stretch to fill width
            children: [
              _buildCombinedContactContainer(),
              const SizedBox(height: 16),
              _buildBusCompanyContactContainer(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 3,
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
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
      ),
    );
  }

  Widget _buildCombinedContactContainer() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Kandy Bus Station
          Text(
            'Kandy Bus Station',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Phone: 0114563787'),
                    SizedBox(height: 4),
                    Text('Operating Hrs: 6:00am - 8:00pm'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5669FF), // Set the button color
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'CALL NOW',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(
            thickness: 1.5,
            color: Colors.grey,
          ),
          const SizedBox(height: 16),
          // Jaffna Bus Station
          Text(
            'Jaffna Bus Station',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('Phone: 0114563787'),
                    SizedBox(height: 4),
                    Text('Operating Hrs: 6:00am - 8:00pm'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF5669FF), // Set the button color
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'CALL NOW',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBusCompanyContactContainer() {
  return Container(
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 2,
          blurRadius: 6,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Bus Company:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        const Text('Phone: 0114563787'),
        const Text('Email: busguide@gmail.com'),
        const Text('Operating Hours: 6:00am - 8:00pm'),
        const SizedBox(height: 8),
        Center( // Center the button
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF5669FF), // Set the button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text(
              'CALL',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    ),
  );
}

}
