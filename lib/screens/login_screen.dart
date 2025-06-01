import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool obsecureText = true; // To toggle password visibility
  // Form key to manage form state (validation and saving)
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Variables to store form input values
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Set background color
      backgroundColor: Color.fromRGBO(156, 184, 149, 1.0),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Welcome Back!',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30), // Space between title and form
                  // Container box for the form fields
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40.0),
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(30, 80, 42, 1.0),
                      borderRadius: BorderRadius.circular(40),
                    ),

                    // Form widget wraps the input fields
                    child: Form(
                      key: formKey, // Link the form key here
                      child: Column(
                        children: [
                          // Email field
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: const InputDecoration(
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                color: Color.fromRGBO(208, 210, 170, 1.0),
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
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
                            onSaved: (value) => email = value,
                          ),

                          const SizedBox(height: 10),

                          // Password field
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            obscureText: obsecureText,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              labelText: 'Password',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(208, 210, 170, 1.0),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  obsecureText
                                      ? Icons
                                          .visibility_off // Hide password icon
                                      : Icons
                                          .remove_red_eye, // Show password icon
                                  color: Color.fromRGBO(
                                    208,
                                    210,
                                    170,
                                    1.0,
                                  ), // Beige color for icon
                                ),
                                onPressed: () {
                                  setState(
                                    () => obsecureText = !obsecureText,
                                  ); // Toggle visibility
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
                          Center(
                            child: TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/forget');
                              },
                              child: const Text(
                                "Forget Password",
                                style: TextStyle(
                                  color: Color.fromRGBO(208, 210, 170, 1.0),
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.0,
                                  decorationColor: Color.fromRGBO(
                                    208,
                                    210,
                                    170,
                                    1.0,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // Sign up button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to registration screen
                      Navigator.pushNamed(context, ('/reg'));
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
                ],
              ),

              // enter button
              Positioned(
                top: constraints.maxHeight * 0.62,
                right: 20,
                child: ElevatedButton(
                  onPressed: () {
                    // When "enter" button is tapped:
                    if (formKey.currentState!.validate()) {
                      // If all fields are valid
                      formKey.currentState!.save(); // Save email and password
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Login successful for $email'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: const Color(
                            0xFF344E41,
                          ), // Dark green background
                        ),
                      );
                      // Navigate to home screen
                      Navigator.pushNamed(context, '/home');
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    minimumSize: const Size(80, 80),
                    padding: const EdgeInsets.all(16),
                    backgroundColor: Color.fromRGBO(
                      208,
                      210,
                      170,
                      1.0,
                    ), // Beige color
                  ),
                  child: const Text(
                    'Enter',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
