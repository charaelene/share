import 'package:flutter/material.dart';
import 'package:mbap_part2/screens/login_screen.dart';
import 'package:mbap_part2/screens/pantry_inventory.dart';
import 'package:mbap_part2/screens/reg_screen.dart';
import 'package:mbap_part2/screens/forget_password.dart';
import 'package:mbap_part2/screens/home_screen.dart';
import 'package:mbap_part2/screens/pantry_editor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      routes: {
        '/login': (context) => LoginScreen(),
        '/reg': (context) => RegisterScreen(),
        '/forget': (context) => ForgetScreen(),
        '/home': (context) => HomeScreen(),
        '/pantry_editor': (context) => PantryEditor(),
        '/pantry_inventory': (context) => PantryInventory(),
      },
    );
  }
}