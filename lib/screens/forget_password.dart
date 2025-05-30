import 'package:flutter/material.dart';

class ForgetScreen extends StatelessWidget {
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A), // Light green color

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,), // Padding for the screen
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Reset Your Password',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            const SizedBox(height: 30), // Space between title and form
            // Container box for the form fields
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF344E41),
                borderRadius: BorderRadius.circular(20),
              ),
              
              child: Form(
                child: Column(
                  children: [
                    // Email field
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please provide an email address.";
                        } else if (!value.contains('@')) {
                          return "Please provide a valid email address.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value;
                      },
                    ),
                    const SizedBox(height: 10),
                    // Submit button
                    ElevatedButton(
                      
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
