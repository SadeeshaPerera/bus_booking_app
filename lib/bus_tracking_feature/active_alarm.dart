import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ActiveAlarmScreen extends StatefulWidget {
  const ActiveAlarmScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ActiveAlarmScreenState createState() => _ActiveAlarmScreenState();
}

class _ActiveAlarmScreenState extends State<ActiveAlarmScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        leading: const Icon(Icons.arrow_back, color: Colors.white),
        title: const Text('Track Bus', style: TextStyle(color: Colors.white)),
        actions: [
          CircleAvatar(
            backgroundImage: Image.asset('assets/images/round_dp.png').image,
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: LatLng(6.9271, 79.8612), // Coordinates for Colombo
                zoom: 10,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('currentLocation'),
                  position: LatLng(6.9271, 79.8612), // Current location
                ),
                const Marker(
                  markerId: MarkerId('destination'),
                  position: LatLng(7.2906, 80.6337), // Coordinates for Kandy
                ),
              },
              polylines: {
                const Polyline(
                  polylineId: PolylineId('route'),
                  points: [
                    LatLng(6.9271, 79.8612), // Colombo
                    LatLng(7.2906, 80.6337), // Kandy
                  ],
                  color: Colors.orange,
                  width: 5,
                ),
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.white,
            child: Row(
              children: [
                const SizedBox(width: 16),
                const Icon(
                  Icons.notifications,
                  color: Colors.blue,
                  size: 50,
                ),
                const SizedBox(width: 26),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Get off next bus stand. You are near to your destination',
                        style: TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text('Turn off',
                                style: TextStyle(color: Colors.white)),
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: const Text('Customize'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 6),
              ],
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
