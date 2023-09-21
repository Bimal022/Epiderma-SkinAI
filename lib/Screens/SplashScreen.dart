import 'package:flutter/material.dart';
import 'HomePage.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // App logo or image
            // Image.asset(
            //   'assets/app_logo.png', // Replace with your app's logo
            //   width: 150,
            //   height: 150,
            // ),
            SizedBox(height: 20),

            // App title or name
            Text(
              'Epiderma',
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            // App slogan or brief description
            Text(
              'Your Skin Health Companion',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),

            SizedBox(height: 30),

            // Get started button
            ElevatedButton(
              onPressed: () {
                // Navigate to the next page (e.g., login/registration)
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              child: Text(
                'Get Started',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
