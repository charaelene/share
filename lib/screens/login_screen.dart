import 'package:flutter/material.dart';
import 'reg_screen.dart';
import 'forget_password.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obsecureText = true; // To toggle password visibility
  // Form key to manage form state (validation and saving)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Variables to store form input values
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A), // Light green background

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0), // Screen padding
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome Back!',
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

              // Form widget wraps the input fields
              child: Form(
                key: _formKey, // Link the form key here
                child: Column(
                  children: [
                    // Email field
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
                        email = value;
                      },
                    ),

                    const SizedBox(height: 10),

                    // Password field
                    TextFormField(
                      style: const TextStyle(color: Colors.white),
                      obscureText: _obsecureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obsecureText
                                ? Icons
                                    .visibility_off // Hide password icon
                                : Icons.remove_red_eye, // Show password icon
                            color: const Color(
                              0xFFDDB892,
                            ), // Beige color for icon
                          ),
                          onPressed: () {
                            setState(() {
                              _obsecureText =
                                  !_obsecureText; // Toggle visibility
                            });
                          },
                        ),
                      ),
                      validator: (value) {
                        // Validate password input
                        if (value == null || value.isEmpty) {
                          return 'Please provide a password.';
                        } else if (value.length < 6) {
                          return 'Password must be at least 6 characters.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value;
                      },
                    ),

                    // Forget password button
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Navigate to forget password screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgetScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "Forget Password",
                          style: TextStyle(
                            color: Color(0xFFE6CCB2),
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 10),
            Row(
              children: [
                Spacer(),
                // Sign up button
                ElevatedButton(
                  onPressed: () {
                    // Navigate to registration screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegScreen()),
                    );
                  },
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF344E41), // Dark green text color
                    ),
                  ),
                ),
                Spacer(), // Spacer to center the button

                const SizedBox(height: 20), // Space before the next button
                // Next button
                GestureDetector(
                  onTap: () {
                    // When "next" is tapped:
                    if (_formKey.currentState!.validate()) {
                      // If all fields are valid
                      _formKey.currentState!.save(); // Save email and password
                      print('Email: $email');
                      print('Password: $password');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login successful for $email'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: const Color(0xFF344E41), // Dark green background
                        ),
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFDDB892), // Beige color
                      shape: BoxShape.circle,
                    ),
                    child: const Text(
                      'next',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
