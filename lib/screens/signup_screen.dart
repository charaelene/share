import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mbap_part2/screens/login_screen.dart';
import 'package:mbap_part2/services/firebase_service.dart';

class SignupScreen extends StatelessWidget {
  static String routeName = '/signup';
  FirebaseService fbService = GetIt.instance<FirebaseService>();

  String? email;
  String? password;
  String? confirmPassword;
  var form = GlobalKey<FormState>();

  void register(context) async {
    bool isValid = form.currentState!.validate();
    if (isValid) {
      form.currentState!.save();
      if (password != confirmPassword) {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Password and Confirm Password does not match!'),
          ),
        );
      } else {
        try {
          await fbService.register(email, password);
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User Registered successfully!')),
          );
        } on FirebaseAuthException catch (e) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(e.code)));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Transport Expenses Tracker'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Form(
          key: form,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(label: Text('Email')),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.length == 0)
                    return "Please provide an email address.";
                  else if (!value.contains('@'))
                    return "Please provide a valid email address.";
                  else
                    return null;
                },
                onSaved: (value) {
                  email = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(label: Text('Password')),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length == 0)
                    return 'Please provide a password.';
                  else if (value.length < 6)
                    return 'Password must be at least 6 characters.';
                  else
                    return null;
                },
                onSaved: (value) {
                  password = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  label: Text('Confirm Password'),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.length == 0)
                    return 'Please provide a password.';
                  else if (value.length < 6)
                    return 'Password must be at least 6 characters.';
                  else
                    return null;
                },
                onSaved: (value) {
                  confirmPassword = value;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  register(context);
                },
                child: const Text('Register'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(
                    context,
                  ).pushReplacementNamed(LoginScreen.routeName);
                },
                child: const Text('Existing user? Login in here!'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
