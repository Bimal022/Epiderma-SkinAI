import 'package:epidermscan/Screens/CommonLayout.dart';
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String degree;
  final String imagePath;
  final double rating;

  Doctor({
    required this.name,
    required this.degree,
    required this.imagePath,
    required this.rating,
  });
}

class DoctorList extends StatelessWidget {
  final List<Doctor> doctors = [
    Doctor(
      name: 'Dr. John Doe',
      degree: 'MD, Dermatology',
      imagePath: 'assets/images/doctor1.jpg',
      rating: 4.5,
    ),
    Doctor(
      name: 'Dr. Sarah Smith',
      degree: 'MD, Dermatology',
      imagePath: 'assets/images/doctor2.jpg',
      rating: 4.8,
    ),
    Doctor(
      name: 'Dr. John Doe',
      degree: 'MD, Dermatology',
      imagePath: 'assets/images/doctor1.jpg',
      rating: 4.5,
    ),
    Doctor(
      name: 'Dr. Sarah Smith',
      degree: 'MD, Dermatology',
      imagePath: 'assets/images/doctor2.jpg',
      rating: 4.8,
    ),
    // Add more doctors as needed
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: doctors.length,
      itemBuilder: (context, index) {
        return _buildDoctorCard(doctors[index]);
      },
    );
  }

  Widget _buildDoctorCard(Doctor doctor) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: AssetImage(doctor.imagePath),
                ),
                SizedBox(width: 16.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.name,
                      style: TextStyle(
                          fontSize: 18.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      doctor.degree,
                      style: TextStyle(fontSize: 14.0),
                    ),
                    Text(
                      'Rating: ${doctor.rating}',
                      style: TextStyle(fontSize: 14.0),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate to the doctor's profile page
                // You can implement this based on your app's navigation logic
              },
              child: Text('View Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
