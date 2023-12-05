import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final TextEditingController _confirmPasswordController =
        TextEditingController();

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
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(right: 30, left: 30),
              child: TextField(
                controller: _nameController,
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
              child: TextField(
                controller: _emailController,
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
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
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
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: _confirmPasswordController,
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
                onPressed: () async {
                  try {
                    if (_passwordController.text !=
                        _confirmPasswordController.text) {
                      print('Passwords do not match');
                      return;
                    }

                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: _emailController.text,
                      password: _passwordController.text,
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Амжилттай бүртгүүллээ'),
                          content: Text('You have successfully signed up.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _nameController.clear();
                                  _emailController.clear();
                                  _passwordController.clear();
                                  _confirmPasswordController.clear();
                                });
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Дахиад оролдоно уу'),
                          content: Text('Error: $e'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                    print('Error: $e');
                  }
                },
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
                    Navigator.pushNamed(context, "/loginScreen");
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
