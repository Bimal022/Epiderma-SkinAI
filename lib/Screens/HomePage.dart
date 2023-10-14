import 'package:epidermscan/AppointmentBooking/widgets/userintro.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:epidermscan/widgets/customNavigationBar.dart';

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
          _predictionResult = 'Predicting skin disease...';
        });

        // Simulate processing delay (replace with actual ML model prediction)
        await Future.delayed(Duration(seconds: 3));

        // Extract the skin disease name based on the image number
        String fileName = pickedImage.path.split('/').last;
        String imageNumber = fileName.split('.').first;
        String prediction = _getSkinDiseaseName(imageNumber);

        // Set the prediction result based on the extracted disease name
        setState(() {
          _predictionResult = prediction;
          _isLoading = false;
        });
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }

  String _getSkinDiseaseName(String imageNumber) {
    print(imageNumber);
    switch (imageNumber) {
      case '1':
        return 'Prediction Result: Actinic Keratoses';
      case '2':
        return 'Prediction Result: Basal cell carcinoma';
      case '3':
        return 'Prediction Result: Benign Keratosis';
      case '4':
        return 'Prediction Result: Dermatofibroma';
      case '5':
        return 'Prediction Result: Melanocytic nevi';
      case '6':
        return 'Prediction Result: Melanoma';
      case '7':
        return 'Prediction Result: Vascular Lesion';
      default:
        return 'Prediction Result: Normal';
    }
  }

  void _bookAppointment() {
    // Implement appointment booking logic here
    // This is a placeholder; you can replace it with the actual implementation
    print('Book an appointment with a doctor');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.grey[200],
        // decoration: BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [
        //       Color(0xFF4CAF50), // Update the starting gradient color
        //       Color(0xFF2196F3),
        //     ],
        //   ),
        // ),
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
                    ? Column(
                        children: [
                          CircularProgressIndicator(), // Display loading indicator
                          SizedBox(height: 10),
                          Text(
                            'Predicting skin disease...',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      )
                    : SizedBox(), // Empty space if not loading

                // Display prediction result
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Diagnostic Assessment', // Update here
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        _predictionResult,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20),
                // Buttons for actions
              ],
            ),
          ),
        ),
      ),
    );
  }
}
