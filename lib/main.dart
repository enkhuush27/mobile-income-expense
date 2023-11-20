import 'package:flutter/material.dart';
import 'onboarding.dart';
import 'splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income and Expenses',
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboard': (context) => Onboard(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
