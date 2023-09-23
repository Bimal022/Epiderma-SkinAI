import 'package:flutter/material.dart';
import 'package:epidermscan/AppointmentBooking/styles/colors.dart'; // Assuming you have a file for colors
import 'package:epidermscan/AppointmentBooking/styles/styles.dart'; // Assuming you have a file for styles

class UserProfilePage extends StatelessWidget {
  final String userName;
  final String userProfileImage;

  const UserProfilePage({
    Key? key,
    required this.userName,
    required this.userProfileImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(MyColors.primary),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              color: Color(MyColors.primary),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(userProfileImage),
                    ),
                  ),
                  Text(
                    userName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'New York, USA',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'About Me',
                    style: kTitleStyle,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus faucibus, sapien quis tincidunt venenatis, orci lectus rhoncus sapien.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(MyColors.grey02),
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Interests',
                    style: kTitleStyle,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Reading, Traveling, Cooking',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(MyColors.grey02),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color(MyColors.primary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      // Add functionality for button
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 20.0,
                      ),
                      child: Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
