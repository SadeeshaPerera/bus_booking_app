import 'package:flutter/material.dart';

class BusTimetableScreen extends StatelessWidget {
  const BusTimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEEEE),
        toolbarHeight: 0, // Hide the AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    const Center(
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage('assets/images/round_dp.png'),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Hey Kamal',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Where you want go?',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.directions_bus_outlined,
                                          color: Colors.black54),
                                      SizedBox(width: 8),
                                      Text(
                                        'Your Location',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                      Spacer(),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                                height: 40), // Space for the CircleAvatar
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.location_pin,
                                          color: Colors.black54),
                                      SizedBox(width: 8),
                                      Text(
                                        'Destination',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Positioned(
                          top: 30, // Adjust the position as needed
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.blue,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.arrow_downward_outlined,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 1),
                                Icon(Icons.arrow_upward_outlined,
                                    color: Colors.white, size: 16),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        const ChoiceChip(label: Text('Today'), selected: true),
                        const SizedBox(width: 8),
                        const ChoiceChip(
                            label: Text('Tomorrow'), selected: false),
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () async {
                            DateTime? selectedDate = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (selectedDate != null) {
                              // Handle the selected date
                              // print('Selected date: $selectedDate');
                            }
                          },
                          child: const ChoiceChip(
                            label: Text('Other'),
                            selected: false,
                            avatar: Icon(Icons.calendar_today, size: 20),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: const Text(
                          'Find Buses',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 400, // Adjust height as needed
                child: ListView(
                  children: const [
                    MenuItemWidget(
                      icon: Icons.announcement,
                      title: 'News Alerts',
                      color: Colors.red,
                    ),
                    MenuItemWidget(
                      icon: Icons.monetization_on,
                      title: 'Bus Fares',
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0, // Set to the active tab
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
}

class MenuItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final Color color;

  const MenuItemWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(icon, color: color),
          title: Text(title),
        ),
      ),
    );
  }
}
