import 'package:flutter/material.dart';
import 'features/auth/screens/login_screen.dart';

void main() {
  runApp(const AustApp());
}

class AustApp extends StatelessWidget {
  const AustApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aust App',
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
