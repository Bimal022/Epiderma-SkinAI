import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;
  bool _isLoading = false;
  String _predictionResult = '';

  Future<void> _pickImage() async {
    try {
      XFile? pickedImage =
          await _imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null && mounted) {
        setState(() {
          _pickedImage = pickedImage;
          _isLoading = true;
        });

        // Simulate processing delay (replace with actual ML model prediction)
        await Future.delayed(Duration(seconds: 3));

        // Simulated prediction result (random number between 0 and 100 as a percentage)
        int randomPrediction = Random().nextInt(101);
        String predictionResult = 'Skin disease prediction: $randomPrediction%';

        setState(() {
          _predictionResult = predictionResult;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _bookAppointment() {
    // Implement appointment booking logic here
    // This is a placeholder, you can replace it with the actual implementation
    print('Book an appointment with a doctor');
  }

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Display picked image
                _pickedImage == null
                    ? Icon(
                        FontAwesomeIcons.camera,
                        size: 50,
                        color: Colors.white,
                      )
                    : Container(
                        height: 200,
                        width: 400,
                        child: Image.file(
                          File(_pickedImage!.path),
                        ),
                      ),

                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _isLoading ? null : _pickImage,
                  child: Text(
                    'Pick Image from Gallery',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                SizedBox(height: 20),
                _isLoading
                    ? CircularProgressIndicator() // Display loading indicator
                    : SizedBox(), // Empty space if not loading

                // Display prediction result
                SizedBox(height: 20),
                Text(
                  'Prediction Result:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  _predictionResult,
                  style: TextStyle(fontSize: 16),
                ),

                SizedBox(height: 20),
                // Buttons for actions
                ElevatedButton.icon(
                  onPressed:
                      _predictionResult.isNotEmpty ? _bookAppointment : null,
                  icon: Icon(FontAwesomeIcons.calendarPlus),
                  label: Text('Book Appointment'),
                ),
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
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Colors.blue,
        backgroundColor: Colors.white,
      ),
    );
  }
}
