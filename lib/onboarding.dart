import 'package:flutter/material.dart';
import 'package:income_expense/main.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //SizedBox(height: 16),
              Image(
                image: AssetImage('assets/man.png'),
              ),
              SizedBox(height: 16),
              Text(
                "Ухаалаг Зарцуулж Илүү Хэмнэе",
                style: TextStyle(
                    fontSize: 32,
                    color: Color(0xFF438883),
                    fontWeight: FontWeight.w800),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    shadowColor: Color(0xFF438883),
                    elevation: 40,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    padding: EdgeInsets.all(0)),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Color(0xFF63B5AF), Color(0xFF438883)],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight),
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                  ),
                  child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 120.0,
                        minHeight: 60.0), // min sizes for Material buttons
                    alignment: Alignment.center,
                    child: Text(
                      "Эхлэх",
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Хэрэглэгчийн эрх бий юу?",
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "Нэвртэх",
                      style: TextStyle(
                          color: Color(0xFF32819A),
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
