import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool obsecureText = true; // To toggle password visibility
  // Form key to manage form state (validation and saving)
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // Controllers for text fields
  final TextEditingController passwordController = TextEditingController();

  String? email;
  String? setPassword;
  String? confirmPassword;

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
                    'Sign Up',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 30),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    padding: EdgeInsets.all(20), // Padding inside the container
                    decoration: BoxDecoration(
                      color: const Color(0xFF344E41),
                      borderRadius: BorderRadius.circular(40),
                    ),

                    // Form widget wraps the input fields
                    child: Form(
                      key: formKey, // Link the form key here
                      child: Column(
                        children: [
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Email',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(208, 210, 170, 1.0),
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
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
                            onSaved: (value) => email = value,
                          ),

                          const SizedBox(height: 16),
                          TextFormField(
                            // Controller for password field
                            controller: passwordController,
                            obscureText: obsecureText,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Set a password',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(208, 210, 170, 1.0),
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Toggle icon based on obsecureText state
                                  obsecureText
                                      ? Icons
                                          .visibility_off // Show password icon
                                      : Icons
                                          .remove_red_eye, // Hide password icon
                                  color: Color.fromRGBO(208, 210, 170, 1.0),
                                ),
                                onPressed: () {
                                  // Toggle visibility
                                  setState(() => obsecureText = !obsecureText);
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please provide a password.";
                              } else if (value.length < 6) {
                                return "Password must be at least 6 characters long.";
                              }
                              return null;
                            },
                            onSaved: (value) {
                              setPassword = value;
                            },
                          ),

                          const SizedBox(height: 16),
                          TextFormField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: 'Confirm password',
                              labelStyle: const TextStyle(
                                color: Color.fromRGBO(208, 210, 170, 1.0),
                              ),
                              errorStyle: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please confirm your password.";
                              } else if (value != passwordController.text) {
                                //compare with the password field
                                return "Passwords do not match.";
                              }
                              return null;
                            },
                            // just for validation
                            onSaved: (value) => confirmPassword = value,
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                  // Sign up button
                  ElevatedButton(
                    onPressed: () {
                      // Navigate to registration screen
                      Navigator.pushNamed(context, ('/login'));
                    },
                    child: const Text(
                      "Log in",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF344E41), // Dark green text color
                      ),
                    ),
                  ),
                ],
              ),

              Positioned(
                top: constraints.maxHeight * 0.64,
                right: 10,
                child: // enter button
                    ElevatedButton(
                  onPressed: () {
                    // When "enter" is tapped:
                    if (formKey.currentState!.validate()) {
                      // If all fields are valid
                      formKey.currentState!.save(); // Save email and password
                      // navigate to home screen
                      Navigator.pushReplacementNamed(context, '/home');
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
                    'Register',
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
