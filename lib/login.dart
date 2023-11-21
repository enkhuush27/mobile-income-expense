import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF0F0F0),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 250,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF429690), Color(0xFF2A7C76)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.elliptical(160, 30),
                      bottomRight: Radius.elliptical(160, 30),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      "Тавтай морилно уу",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 22,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                Container(
                  width: 50,
                  height: 100,
                  decoration: const BoxDecoration(
                    color: Color(0xFFACF0FF),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 50,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xA65DD6F0), Color(0xA65DD6F0)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                  ),
                ),
              ],
            ),
            // Image(
            //   image: AssetImage(),
            // ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                  hintText: "Enter your email address",
                  fillColor: Color(0xFFFFFFFF),
                  filled: true,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
