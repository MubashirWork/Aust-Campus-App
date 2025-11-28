import 'package:flutter/material.dart';
import 'features/auth/screens/login_screen.dart';
import 'package:flutter/services.dart';


void main() {

  WidgetsFlutterBinding.ensureInitialized();

  // Hide status bar, time, battery, and make full screen
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

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
