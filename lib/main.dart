import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'loginpage.dart';
import 'routesPage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  print("Initialized");

  try {
    await Firebase.initializeApp();
    print("Firebase Initialized");

    bool isUserLoggedIn = await checkUserLoggedIn();
    print("User Checked");

    runApp(MyApp(isUserLoggedIn: isUserLoggedIn));
  } catch (e) {
    print("Error initializing Firebase: $e");
  }
}

Future<bool> checkUserLoggedIn() async {
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user = _auth.currentUser;
  return user != null; // Return true if the user is logged in, otherwise false
}

class MyApp extends StatelessWidget {
  final bool isUserLoggedIn;

  MyApp({required this.isUserLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isUserLoggedIn ? RoutesPage() : LoginPage(),
    );
  }
}
