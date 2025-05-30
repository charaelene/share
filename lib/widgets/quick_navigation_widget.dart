import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuickNavigationWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  final String label;
  final Color bgColor;

  const QuickNavigationWidget({
    super.key,
    this.onPressed,
    required this.icon,
    required this.label,
    required this.bgColor,
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
        minimumSize: Size(115.0, 110.0),
      ),
      onPressed: onPressed ?? () {},
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
