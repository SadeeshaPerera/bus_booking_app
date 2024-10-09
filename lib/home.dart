import 'package:bus_booking_app/bus_tracking_feature/active_alarm.dart';
import 'package:bus_booking_app/bus_tracking_feature/customize_alarm.dart';

import 'package:bus_booking_app/bus_tracking_feature/route_details.dart';

import 'package:bus_booking_app/bus_tracking_feature/bus_time_table_screen.dart';
import 'package:bus_booking_app/general_screens/bus_onboarding_screens.dart';

import 'package:bus_booking_app/notification_panel_screen.dart';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import 'package:bus_booking_app/AnnouncementScreen.dart'; // Import the AnnouncementScreen
import 'package:bus_booking_app/t-2-bus-booking-feature/pages/sample_route_page.dart';
import 'package:bus_booking_app/general_screens/app_splash_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute<ProfileScreen>(
                  builder: (context) => ProfileScreen(
                    appBar: AppBar(
                      title: const Text('User Profile'),
                    ),
                    actions: [
                      SignedOutAction((context) {
                        Navigator.of(context).pop();
                      })
                    ],
                    children: [
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(2),
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset('assets/images/round_dp.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/Bus_App_Logo_3.png'),
              Text(
                'Welcome!',
                style: Theme.of(context).textTheme.displaySmall,
              ),
              const SignOutButton(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AppSplashScreen()),
                  );
                },
                child: Text('Bus Splash Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BusOnboardingScreen()),
                  );
                },
                child: Text('Bus  Onboarding Screen'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BusTimetableScreen()),
                  );
                },
                child: Text('Bus Timetable'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SampleRoutePage()),
                  );
                },
                child: const Text('Bus seat booking'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
