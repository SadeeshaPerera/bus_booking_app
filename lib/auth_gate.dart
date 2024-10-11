import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'home.dart'; // Regular user home screen
import 'admin_screen.dart'; // Admin screen for managing notifications

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  // Example callback function to handle adding notifications
  void addNotification(String title, String subtitle, String icon, String time) {
    // Logic to handle adding notifications
    print("Notification added: $title, $subtitle, $icon, $time");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: "YOUR_WEBCLIENT_ID"), // Update this with your actual web client ID
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/Bus_App_Logo_3.png'),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome to BGLK, please sign in!')
                    : const Text('Welcome to BGLK, please sign up!'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            sideBuilder: (context, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset('assets/images/Bus_App_Logo_3.png'),
                ),
              );
            },
          );
        }

        // Check if the logged-in user is an admin
        final User? user = snapshot.data;
        if (user != null && user.email == 'admin@bus.com') {
          // Redirect to AdminScreen if the logged-in user is the admin
          return AdminScreen(addNotificationCallback: addNotification); // Pass the callback here
        }

        // Redirect regular users to the HomeScreen
        return const HomeScreen();
      },
    );
  }
}
