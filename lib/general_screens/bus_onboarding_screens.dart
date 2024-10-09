import 'package:bus_booking_app/home.dart';
import 'package:flutter/material.dart';
// Replace with your main screen import

class BusOnboardingScreen extends StatefulWidget {
  @override
  _BusOnboardingScreenState createState() => _BusOnboardingScreenState();
}

class _BusOnboardingScreenState extends State<BusOnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "title": "Real-Time Bus Tracking",
      "description":
          "Track buses in real time, so you're always on time. Never miss your bus with live location updates and route progress.",
      "image": "assets/images/Onboarding_image_1.png"
    },
    {
      "title": "Hastle Free Booking",
      "description":
          "Book your seat in advance and get a quick QR code confirmation. Secure your ride with ease and cancel if needed.",
      "image": "assets/images/Onboarding_image_2.png"
    },
    {
      "title": "Help and Support ",
      "description":
          "Lost something? Report missing items or check if someone found them. Stay connected with others",
      "image": "assets/images/Onboarding_image_3.png"
    },
    {
      "title": "Alerts and News Updates",
      "description":
          "Stay informed with real-time bus alerts and news. Get notifications on delays, route changes, and service updates.",
      "image": "assets/images/Onboarding_image_4.png"
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _navigateToMainScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => HomeScreen()), // Replace with your main screen
    );
  }

  Widget _buildPageContent(Map<String, String> data) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Top section with app logo and title
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.blue[700],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App logo and title
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/UEE_Bus_App_Logo_3_Circle.png',
                      fit: BoxFit.contain,
                      height: 50,
                      width: 50,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'BGLK',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'Simplified Journey\nThe Ultimate Bus Booking App',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Illustration and text description
        Expanded(
          flex: 3,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Expanded(
                  child: Image.asset(
                    data["image"]!,
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  data["title"]!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  data["description"]!,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                // Indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onboardingData.length,
                    (index) => buildDot(index == _currentPage),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: onboardingData.length,
                itemBuilder: (context, index) =>
                    _buildPageContent(onboardingData[index]),
              ),
            ),
            _currentPage == onboardingData.length - 1
                ? ElevatedButton(
                    onPressed: _navigateToMainScreen,
                    child: Text("Get Started"),
                  )
                : ElevatedButton(
                    onPressed: () {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.ease,
                      );
                    },
                    child: Text("Next"),
                  ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // Helper function to build indicator dots
  Widget buildDot(bool isActive) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: 10,
      decoration: BoxDecoration(
        color: isActive ? Colors.blue : Colors.blue[200],
        shape: BoxShape.circle,
      ),
    );
  }
}
