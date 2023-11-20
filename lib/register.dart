import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFF0F0F0),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
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
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none),
                  hintText: 'Бүтэн нэрээ оруулна уу?',
                  fillColor: Color(0xFFFFFFFF),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none),
                  hintText: 'Имейлээ оруулна уу?',
                  fillColor: Color(0xFFFFFFFF),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none),
                  hintText: 'Нууц үгээ оруулаарай',
                  fillColor: Color(0xFFFFFFFF),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25.0),
                      borderSide: BorderSide.none),
                  hintText: 'Нууц үгээ давтан оруулаарай',
                  fillColor: Color(0xFFFFFFFF),
                  filled: true,
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 20.0),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(0)),
                child: Ink(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF63B5AF), Color(0xFF438883)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 120.0,
                        minHeight: 70.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: const Text(
                      "Бүртгүүлэх",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Хэрэглэгчийн эрх бий юу?",
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                  },
                  child: Text(
                    "Нэвртэх",
                    style: TextStyle(
                        color: Color(0xFF32819A), fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
