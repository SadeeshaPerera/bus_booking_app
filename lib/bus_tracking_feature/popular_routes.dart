import 'package:flutter/material.dart';

class PopularRouteDetailsScreen extends StatelessWidget {
  final routes = [
    {
      "image": "assets/images/popular_routes_1.png",
      "title": "Colombo-Kandy",
      "price": "LKR 550/-",
      "location": "Colombo-Kandy A1 Rd",
      "rating": 4.6
    },
    {
      "image": "assets/images/popular_routes_2.png",
      "title": "Galle-Kandy",
      "price": "LKR 1000/-",
      "location": "E01 and Kandy-Cmb ",
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

  PopularRouteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: const Icon(Icons.arrow_back, color: Colors.white),
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Main Routes', icon: Icons.directions_bus),
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Highway Routes', icon: Icons.alt_route),
                  SizedBox(width: 8),
                  FilterChipWidget(
                      label: 'Short Routes', icon: Icons.location_on),
                  SizedBox(width: 8),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: routes.length,
              itemBuilder: (context, index) {
                return RouteCard(
                  route: routes[index],
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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

  const FilterChipWidget({super.key, required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 5),
          Text(label),
        ],
      ),
      selected: false,
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
