import 'package:bus_booking_app/AnnouncementScreen.dart';
import 'package:bus_booking_app/bus_tracking_feature/active_alarm.dart';
import 'package:bus_booking_app/bus_tracking_feature/popular_routes.dart';
import 'package:bus_booking_app/bus_tracking_feature/search_results.dart';
import 'package:bus_booking_app/home.dart';
import 'package:bus_booking_app/notification_panel.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/no_ticket_screen.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/pages/sample_route_page.dart';
import 'package:flutter/material.dart';

class BusTimetableScreen extends StatefulWidget {
  const BusTimetableScreen({super.key});

  @override
  _BusTimetableScreenState createState() => _BusTimetableScreenState();
}

class _BusTimetableScreenState extends State<BusTimetableScreen> {
  int _selectedIndex = 0;
  String _selectedLocation = 'Colombo Fort';
  String _selectedDestination = 'Pettah';
  String _selectedDate = 'Today';

  List<String> busStops = [
    'Colombo Fort',
    'Pettah',
    'Bambalapitiya',
    'Wellawatte',
    'Dehiwala',
    'Mount Lavinia',
    'Moratuwa',
    'Panadura',
    'Kalutara',
    'Galle',
    'Matara',
    'Kandy',
    'Peradeniya',
    'Nuwara Eliya',
    'Badulla',
    'Ratnapura',
    'Kurunegala',
    'Anuradhapura',
    'Polonnaruwa',
    'Jaffna'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => BusTimetableScreen()),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NoTicketsScreen()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PopularRouteDetailsScreen()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AnnouncementScreen()),
        );
        break;
    }
  }

  void _showLocationDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: busStops.map((String value) {
            return ListTile(
              title: Text(value),
              onTap: () {
                setState(() {
                  _selectedLocation = value;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  void _showDestinationDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: busStops.map((String value) {
            return ListTile(
              title: Text(value),
              onTap: () {
                setState(() {
                  _selectedDestination = value;
                });
                Navigator.pop(context);
              },
            );
          }).toList(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEEEEE),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFFEEEEEE),
        toolbarHeight: 0, // Hide the AppBar
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeScreen()),
                              );
                            },
                            child: const Center(
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 30,
                                    backgroundImage: AssetImage(
                                        'assets/images/round_dp.png'),
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
                                      fontWeight: FontWeight.w500,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Column(
                                children: [
                                  GestureDetector(
                                    onTap: () => _showLocationDropdown(context),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(
                                              Icons.directions_bus_outlined,
                                              color: Colors.black54),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Your Location',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                          const Spacer(),
                                          Text(
                                            _selectedLocation,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                      height: 9), // Space for the CircleAvatar
                                  GestureDetector(
                                    onTap: () =>
                                        _showDestinationDropdown(context),
                                    child: Container(
                                      padding: const EdgeInsets.all(12),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            spreadRadius: 2,
                                            blurRadius: 5,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.location_pin,
                                              color: Colors.black54),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Destination',
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                          const Spacer(),
                                          Text(
                                            _selectedDestination,
                                            style: const TextStyle(
                                                fontSize: 16,
                                                color: Colors.black54),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Positioned(
                                top: 30,
                                right: 15, // Adjust the position as needed
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: Colors.white,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.arrow_downward_outlined,
                                          color: Colors.blue, size: 16),
                                      SizedBox(width: 1),
                                      Icon(Icons.arrow_upward_outlined,
                                          color: Colors.blue, size: 16),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              ChoiceChip(
                                label: Text('Today'),
                                selected: _selectedDate == 'Today',
                                selectedColor: const Color.fromARGB(
                                    255,
                                    224,
                                    240,
                                    253), // Specific color for selected chip
                                onSelected: (bool selected) {
                                  setState(() {
                                    _selectedDate = 'Today';
                                  });
                                },
                              ),
                              const SizedBox(width: 8),
                              ChoiceChip(
                                label: Text('Tomorrow'),
                                selected: _selectedDate == 'Tomorrow',
                                selectedColor:
                                    const Color.fromARGB(255, 224, 240, 253),
                                // Specific color for selected chip
                                onSelected: (bool selected) {
                                  setState(() {
                                    _selectedDate = 'Tomorrow';
                                  });
                                },
                              ),
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
                                    setState(() {
                                      _selectedDate = 'Other';
                                    });
                                  }
                                },
                                child: ChoiceChip(
                                  label: Text('Other'),
                                  selected: _selectedDate == 'Other',
                                  selectedColor: Colors
                                      .blue, // Specific color for selected chip
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SearchResultsScreen()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                backgroundColor: Colors.blue,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 72, vertical: 6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
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
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        NotificationPanelScreen()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 90,
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
                                child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/news_alert.png',
                                      width: 68,
                                      height: 68,
                                    ),
                                    title: const Padding(
                                      padding: EdgeInsets.fromLTRB(60, 8, 0, 0),
                                      child: Text('News Alerts',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PopularRouteDetailsScreen()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 90,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.shade200,
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                      ),
                                    ]),
                                child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/bus_fares.png',
                                      // color: Colors.orange,
                                      width: 68,
                                      height: 68,
                                    ),
                                    title: const Padding(
                                      padding: EdgeInsets.fromLTRB(60, 8, 0, 0),
                                      child: Text(
                                        'Bus Fares',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AnnouncementScreen()),
                              );
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 90,
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
                                child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  child: ListTile(
                                    leading: Image.asset(
                                      'assets/images/support_desk.png',
                                      width: 68,
                                      height: 68,
                                    ),
                                    title: const Padding(
                                      padding: EdgeInsets.fromLTRB(60, 8, 0, 0),
                                      child: Text('Support Desk',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // New Card Below Support Desk
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ActiveAlarmScreen()),
                              );
                              // Add your navigation or action here
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 90,
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
                                child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  child: ListTile(
                                    leading: Icon(
                                      Icons.directions_bus,
                                      size: 68,
                                      color: Colors.blue,
                                    ),
                                    title: const Padding(
                                      padding: EdgeInsets.fromLTRB(60, 8, 0, 0),
                                      child: Text('Track Bus',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ScheduleRoutePage()),
                              );
                              // Add your navigation or action here
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Container(
                                height: 90,
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
                                child: Container(
                                  margin: const EdgeInsets.all(15.0),
                                  child: const ListTile(
                                    leading: Icon(
                                      Icons.chair_alt_outlined,
                                      size: 68,
                                      color: Colors.amber,
                                    ),
                                    title: Padding(
                                      padding: EdgeInsets.fromLTRB(60, 8, 0, 0),
                                      child: Text('Book a Seat',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
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
      ),
    );
  }
}
