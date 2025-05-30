import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final int lines;
  const TextfieldWidget({
    super.key,
    required this.controller,
    required this.hintText,
    this.lines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.black,
      minLines: lines,
      maxLines: lines,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: hintText,
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(117, 183, 126, 1.0),
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromRGBO(117, 183, 126, 1.0),
            width: 1.0,
          ),
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
        ),
        floatingLabelStyle: TextStyle(color: Colors.black),
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      keyboardType: TextInputType.text,
    );
  }
}