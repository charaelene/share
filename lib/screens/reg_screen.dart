import 'package:flutter/material.dart';
import 'login_screen.dart';

class RegScreen extends StatefulWidget {
  @override
  State<RegScreen> createState() => _RegScreenState();
}

class _RegScreenState extends State<RegScreen> {
  bool _obsecureText = true; // To toggle password visibility
  // Form key to manage form state (validation and saving)
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Controllers for text fields
  final TextEditingController passwordController = TextEditingController();


  String? email;
  String? setPassword;
  String? confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFA3B18A),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
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
              padding: const EdgeInsets.all(20), // Padding inside the container
              decoration: BoxDecoration(
                color: const Color(0xFF344E41),
                borderRadius: BorderRadius.circular(20),
              ),

              // Form widget wraps the input fields
              child: Form(
                key: _formKey, // Link the form key here
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        labelStyle: const TextStyle(color: Colors.white),
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

                    const SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController, // Controller for password field
                      obscureText: _obsecureText,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Set a password',
                        labelStyle: const TextStyle(color: Colors.white),
                        suffixIcon: IconButton(
                          icon: Icon( // Toggle icon based on _obsecureText state
                            _obsecureText
                                ? Icons.visibility_off // Show password icon
                                : Icons.remove_red_eye, // Hide password icon
                            color: Color(0xFFDDB892),
                          ),
                          onPressed: () {
                            setState(() {
                              _obsecureText = !_obsecureText; // Toggle visibility
                            });
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
                      decoration: InputDecoration(
                        labelText: 'Confirm password',
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please confirm your password.";
                        } else if (value != passwordController.text) { //compare with the password field
                          return "Passwords do not match.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        confirmPassword = value;
                        // just for validation
                      },
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginScreen()),
                    );
                  },
                  child: const Text(
                    'Log in',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF344E41),
                    ),
                  ),
                ),
                Spacer(),
                const SizedBox(height: 20),
                // Next button
                GestureDetector(
                  onTap: () {
                    // When "next" is tapped:
                    if (_formKey.currentState!.validate()) {
                      // If all fields are valid
                      _formKey.currentState!.save(); // Save email and password
                      print('Email: $email');
                      print('Password: $setPassword');
                      print('Confirm Password: $confirmPassword');
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
