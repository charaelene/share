import 'package:flutter/material.dart';
import 'package:mbap_part2/screens/login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Screen',
      debugShowCheckedModeBanner: false, 
      // Define the default brightness and colors
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFA3B18A)),
        useMaterial3: true,
      ),
      home: LoginScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('App Name'),
      ),
      body: const Center(
        child: Text('This is a sample Text widget'),
      ),
    );  
  }
}


// this is a test