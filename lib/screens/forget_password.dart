import 'package:flutter/material.dart';

class ForgetScreen extends StatefulWidget {
  const ForgetScreen({super.key});
  
  @override
  State<ForgetScreen> createState() => _ForgetScreenState();
}

class _ForgetScreenState extends State<ForgetScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
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

            const SizedBox(height: 20),
            // Container for the input fields
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF344E41),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Form(
                key: _formKey, // Link the form key here
                child: Column(
                  children: [
                    // Input field for email
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: 'Email',
                        labelStyle: TextStyle(color: Colors.white),
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        // Validate email input
                        if (value == null || value.isEmpty) {
                          return "Please provide an email address.";
                        } else if (!value.contains('@')) {
                          return "Please provide a valid email address.";
                        }
                        return null; // Valid
                      },
                      onSaved: (value) {
                        email = value; // Save the email input
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
            // Button to send reset link
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Reset link sent to your $email'),
                      duration: const Duration(seconds: 2),
                      backgroundColor: const Color(0xFF344E41), // Dark green background
                    ),
                  );
                }
              },
              child: const Text('Send Reset Link'),
            ),
          ],
        ),
      ),
    );
  }
}
