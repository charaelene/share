import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuickNavigationWidget extends StatelessWidget {
  final VoidCallback? onPressed; // Callback for button press
  // Icon, label, and background color for the button
  final IconData icon;
  final String label;
  final Color bgColor;

  const QuickNavigationWidget({ // Constructor with named parameters
    super.key, // Key for the widget
    this.onPressed, // Optional callback for button press
    required this.icon, // Icon to display in the button
    required this.label, // Label text for the button
    required this.bgColor, // Background color for the button
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor,
        padding: EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        minimumSize: Size(129.0, 129.0),
      ),
      onPressed: onPressed ?? () {}, //ensures the button is always clickable
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FaIcon(icon, size: 50.0, color: Color.fromRGBO(46, 94, 55, 1.0)),
          Text(
            label,
            style: TextStyle(
              color: Color.fromRGBO(46, 94, 55, 1.0),
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              fontSize: 17.0,
            ),
          ),
        ],
      ),
    );
  }
}
