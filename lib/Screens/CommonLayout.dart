import 'package:flutter/material.dart';
import 'DoctorList.dart';
import 'HomePage.dart';

class CommonLayout extends StatelessWidget {
  final Widget child;
  final int selectedIndex; // The selected index for the bottom navigation bar

  CommonLayout({
    required this.child,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epiderma'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF74ABE2), Color(0xFF5563DE)],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Wrap child with Expanded to take available vertical space
                Expanded(child: child),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Doctor Booking',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
        onTap: (index) {
          // Implement navigation based on the index
          if (index == 0) {
            // Navigate to Home (HomePage)
            Navigator.pushReplacementNamed(context, '/');
          } else if (index == 1) {
            // Navigate to Doctor Booking
            Navigator.pushNamed(context, '/doctorlist');
          } else if (index == 2) {
            // Navigate to Profile
            // Replace this with the appropriate navigation logic for the profile screen
          }
        },
      ),
    );
  }
}
