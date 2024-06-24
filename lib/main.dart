import 'package:flutter/material.dart';
import 'package:login/details.dart';
import 'package:login/Login_Screen.dart';
// import 'package:login/homepage.dart';
import 'package:login/Splash_Screen.dart';

void main() {
  runApp(const Login());
}

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        'home': (context) => Homepage(),
        'details': (context) => Details(),
      },
    );
  }
}
