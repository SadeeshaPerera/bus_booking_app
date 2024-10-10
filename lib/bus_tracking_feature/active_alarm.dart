import 'package:bus_booking_app/bus_tracking_feature/bus_time_table_screen.dart';
import 'package:bus_booking_app/bus_tracking_feature/customize_alarm.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:bus_booking_app/home.dart';
import 'package:bus_booking_app/t-2-bus-booking-feature/no_ticket_screen.dart';
import 'package:bus_booking_app/bus_tracking_feature/popular_routes.dart';
import 'package:bus_booking_app/AnnouncementScreen.dart';

class ActiveAlarmScreen extends StatefulWidget {
  const ActiveAlarmScreen({super.key});

  @override
  _ActiveAlarmScreenState createState() => _ActiveAlarmScreenState();
}

class _ActiveAlarmScreenState extends State<ActiveAlarmScreen> {
  late GoogleMapController _mapController;
  final TextEditingController _searchController = TextEditingController();
  final LatLng _initialPosition = const LatLng(6.9271, 79.8612); // Colombo
  final LatLng _destinationPosition = const LatLng(7.2906, 80.6337); // Kandy
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: const MarkerId('currentLocation'),
        position: _initialPosition,
        infoWindow: const InfoWindow(title: 'Current Location'),
      ),
    );
    _markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: _destinationPosition,
        infoWindow: const InfoWindow(title: 'Destination'),
      ),
    );
    _polylines.add(
      Polyline(
        polylineId: const PolylineId('route'),
        points: [_initialPosition, _destinationPosition],
        color: Colors.orange,
        width: 5,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void _searchAndNavigate() {
    // Implement search functionality here
  }

  void _goToCurrentLocation() {
    _mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: _initialPosition, zoom: 14),
      ),
    );
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
        title: const Text('Track Bus', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: CircleAvatar(
              backgroundImage: Image.asset('assets/images/round_dp.png').image,
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/mapbg.png',
              fit: BoxFit.cover,
            ),
          ),
          // Main Content
          Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    GoogleMap(
                      onMapCreated: _onMapCreated,
                      initialCameraPosition: CameraPosition(
                        target: _initialPosition,
                        zoom: 10,
                      ),
                      markers: _markers,
                      polylines: _polylines,
                    ),
                    Positioned(
                      top: 10,
                      left: 15,
                      right: 15,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.search),
                              onPressed: _searchAndNavigate,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _searchController,
                                decoration: const InputDecoration(
                                  hintText: 'Search location',
                                  border: InputBorder.none,
                                ),
                                onSubmitted: (value) {
                                  _searchAndNavigate();
                                },
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                _searchController.clear();
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 80,
                      right: 15,
                      child: FloatingActionButton(
                        onPressed: _goToCurrentLocation,
                        backgroundColor: Colors.blue,
                        child:
                            const Icon(Icons.my_location, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.red[
                              400], // Adjust the background color as needed
                          radius: 30, // Adjust the radius as needed
                          child: const Icon(
                            Icons.notifications,
                            color: Colors.white,
                            size: 30, // Adjust the icon size as needed
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Get off next bus stand. You are near to your destination',
                                style: TextStyle(fontSize: 16),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      print('Turn off button pressed');
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                    ),
                                    child: const Text(
                                      'Turn off',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ),
                                  // const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              CustomizeAlarmScreen(),
                                        ),
                                      );
                                    },
                                    child: const Text('Customize',
                                        style: TextStyle(color: Colors.green)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2, // Set the active selection
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
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
                MaterialPageRoute(
                    builder: (context) => PopularRouteDetailsScreen()),
              );
              break;
            case 3:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AnnouncementScreen()),
              );
              break;
          }
        },
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
