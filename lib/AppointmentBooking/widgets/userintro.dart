import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserIntro extends StatelessWidget {
  const UserIntro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: fetchUserData(), // Fetch user data from Firebase
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Loading indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          // User data fetched successfully
          final userData = snapshot.data as Map<String, dynamic>;
          final username = userData['username'] ?? 'Guest';
          final profilePictureUrl = userData['profilePictureUrl'] ??
              'assets/avatars/users-1.png'; // Update key to match Firebase data

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hello',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Text(
                    '$username 👋', // Display the username
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              CircleAvatar(
                backgroundImage: AssetImage(profilePictureUrl),
                backgroundColor: Colors.transparent,
              ),
            ],
          );
        }
      },
    );
  }

  // Function to fetch user data from Firebase
  Future<Map<String, dynamic>> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userId = user.uid;

      try {
        // Fetch user data from Firestore
        final docSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();

        if (docSnapshot.exists) {
          final userData = docSnapshot.data() as Map<String, dynamic>;

          return {
            'username': userData['username'] ?? 'Guest',
            'profilePictureUrl': userData['dp'] ??
                'assets/avatars/users-1.png', // Update key to match Firebase data
          };
        }
      } catch (error) {
        print('Error fetching user data: $error');
      }
    }
    // Default data if user or data not found
    return {
      'username': 'Guest',
      'profilePictureUrl': 'assets/avatars/users-1.png',
    };
  }
}
