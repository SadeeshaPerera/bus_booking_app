import 'package:bus_booking_app/AnnouncementScreen.dart';
import 'package:bus_booking_app/bus_tracking_feature/bus_time_table_screen.dart';
import 'package:bus_booking_app/bus_tracking_feature/route_details.dart';
import 'package:bus_booking_app/home.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/no_ticket_screen.dart';
import 'package:flutter/material.dart';

class PopularRouteDetailsScreen extends StatefulWidget {
  @override
  _PopularRouteDetailsScreenState createState() =>
      _PopularRouteDetailsScreenState();
}

class _PopularRouteDetailsScreenState extends State<PopularRouteDetailsScreen> {
  int _selectedIndex = 0;
  String selectedFilterCriteria = '';

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

  final List<Map<String, dynamic>> routes = [
    {
      "image": "assets/images/popular_routes_1.png",
      "title": "Colombo-Kandy",
      "price": "LKR 550/-",
      "location": "Colombo-Kandy",
      "rating": 4.6
    },
    {
      "image": "assets/images/popular_routes_2.png",
      "title": "Galle-Kandy",
      "price": "LKR 1000/-",
      "location": "Galle-Kandy",
      "rating": 4.6
    },
    {
      "image": "assets/images/popular_routes_3.png",
      "title": "Kandy-Jaffna",
      "price": "LKR 500/-",
      "location": "Kandy-Jaffna",
      "rating": 4.6
    },
    {
      "image": "assets/images/popular_routes_4.png",
      "title": "Ja Ela-Yakkala",
      "price": "LKR 500/-",
      "location": "Ja Ela-Yakkala",
      "rating": 4.6
    },
  ];

  List<Map<String, dynamic>> get filteredRoutes {
    if (selectedFilterCriteria.isEmpty) {
      return routes;
    } else {
      return routes.where((route) {
        switch (selectedFilterCriteria) {
          case 'mainRoutes':
            return route['title'].contains('Colombo') ||
                route['title'].contains('Kandy');
          case 'highwayRoutes':
            return route['title'].contains('Galle') ||
                route['title'].contains('Jaffna');
          case 'shortRoutes':
            return route['title'].contains('Ja Ela') ||
                route['title'].contains('Yakkala');
          default:
            return true;
        }
      }).toList();
    }
  }

  void onFilterSelected(String criteria) {
    setState(() {
      selectedFilterCriteria = criteria;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            const Text('Route Details', style: TextStyle(color: Colors.white)),
        actions: [
          CircleAvatar(
            backgroundImage: Image.asset('assets/images/round_dp.png').image,
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: 'Search Route No/Route Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Main Routes',
                      icon: Icons.directions_bus,
                      onSelected: onFilterSelected,
                      filterCriteria: 'mainRoutes'),
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Highway Routes',
                      icon: Icons.alt_route,
                      onSelected: onFilterSelected,
                      filterCriteria: 'highwayRoutes'),
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Short Routes',
                      icon: Icons.location_on,
                      onSelected: onFilterSelected,
                      filterCriteria: 'shortRoutes'),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRoutes.length,
              itemBuilder: (context, index) {
                final route = filteredRoutes[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RouteDetailsScreen(
                          title: route['title'],
                          image: route['image'],
                          price: route['price'],
                          location: route['location'],
                          rating: route['rating'],
                        ),
                      ),
                    );
                  },
                  child: RouteCard(route: route),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.confirmation_number),
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

class FilterChipWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final Function(String) onSelected;
  final String filterCriteria;

  const FilterChipWidget({
    super.key,
    required this.label,
    required this.icon,
    required this.onSelected,
    required this.filterCriteria,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(filterCriteria),
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

class RouteCard extends StatelessWidget {
  final Map<String, dynamic> route;

  const RouteCard({super.key, required this.route});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
      child: Container(
        height: 120,
        child: Column(
          children: [
            ListTile(
              minVerticalPadding: 25,
              leading: Image.asset(
                route['image'],
                fit: BoxFit.cover,
                width: 70,
                height: 70,
              ),
              title: Text(route['title'],
                  style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(route['price']),
                  Row(
                    children: [
                      const Icon(Icons.location_on, size: 16),
                      const SizedBox(width: 4),
                      Text(route['location']),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.star, color: Colors.amber, size: 16),
                  const SizedBox(width: 4),
                  Text(route['rating'].toString()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
