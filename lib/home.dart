import 'package:flutter/material.dart';
import './cons/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Header(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 60),
                      child: Text(
                        "Өглөөний мэнд?",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Б.Энхүүш",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 20,
                  top: 60,
                  child: Icon(
                    Icons.notification_add_outlined,
                    color: Color(0xFFFFFFFF),
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 120),
                        width: double.infinity,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2F7E79),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
