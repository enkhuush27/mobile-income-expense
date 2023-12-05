import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    callDelay(context);
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [Color(0xFF63B5AF), Color(0xFF438883)],
          )),
          child: Center(
            child: Text(
              "Сайн уу",
              style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 50,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }

  Future callDelay(BuildContext context) async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushNamed(context, "/onboard");
  }
}
