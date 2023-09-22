import 'package:epidermscan/AppointmentBooking/screens/home.dart';
import 'package:epidermscan/widgets/customNavigationBar.dart';
import 'package:flutter/material.dart';
import 'AppointmentBooking/screens/doctor_detail.dart';
import 'Screens/DoctorList.dart';
import 'Screens/HomePage.dart';

class RoutesPage extends StatefulWidget {
  @override
  _RoutesPageState createState() => _RoutesPageState();
}

class _RoutesPageState extends State<RoutesPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    // SplashScreen(),
    HomePage(),
    DoctorDetails(),
    Home(),
    // DoctorProfile(
    //     doctorName: "Kumar Bimal",
    //     doctorDegree: "MBBS",
    //     imagePath: "assets/doctorImages/doctor.jpg",
    //     rating: 5.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: customNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
