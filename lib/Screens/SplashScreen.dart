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
            // Animated app logo or image
            Hero(
              tag: 'appLogo',
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/app_logo.png'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Animated app title or name
            Hero(
              tag: 'appName',
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Text(
                  'Epiderma',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // Animated app slogan or brief description
            Hero(
              tag: 'appSlogan',
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                child: Text(
                  'Your Skin Health Companion',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),

            SizedBox(height: 30),

            // Get started button with animation
            Hero(
              tag: 'getStartedButton',
              child: AnimatedContainer(
                duration: Duration(seconds: 1),
                curve: Curves.easeInOut,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate to the next page (e.g., login/registration)
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.transparent,
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
