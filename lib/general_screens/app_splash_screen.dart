import 'package:bus_booking_app/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'; // For loading indicator

class AppSplashScreen extends StatefulWidget {
  @override
  _AppSplashScreenState createState() => _AppSplashScreenState();
}

class _AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToMainScreen();
  }

  _navigateToMainScreen() async {
    await Future.delayed(Duration(seconds: 3), () {});
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()), // Replace with your main screen
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/images/Bus_App_Logo_3.png',
                height: 100), // Replace with your logo
            const SizedBox(height: 20),
            const Text(
              'Bus Schedule & Tracking',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            const SpinKitFadingCircle(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
    );
  }
}
