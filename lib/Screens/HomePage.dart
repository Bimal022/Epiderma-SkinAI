import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;
  bool _isLoading = false;

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
        Future.delayed(Duration(seconds: 3), () {
          // Process the image and get the prediction result

          // Simulated prediction result
          String predictionResult = 'Skin disease prediction: 80%';

          setState(() {
            _isLoading = false;
          });

          // Show the prediction result
          _showPredictionDialog(predictionResult);
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  void _showPredictionDialog(String result) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prediction Result'),
          content: Text(result),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
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
                        child: Image.file(File(_pickedImage!.path))),

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
