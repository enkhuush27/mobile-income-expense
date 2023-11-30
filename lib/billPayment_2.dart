import 'package:flutter/material.dart';
import 'package:income_expense/cons/body.dart';
import 'package:income_expense/cons/bottomNav.dart';
import 'package:income_expense/cons/header.dart';

class BillPaymentNext extends StatefulWidget {
  const BillPaymentNext({super.key});

  @override
  State<BillPaymentNext> createState() => _BillPaymentNextState();
}

class _BillPaymentNextState extends State<BillPaymentNext> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: Stack(
        children: [
          BottomNav(),
          Header(),
          Stack(
            children: [
              BodyContainer(),
              Container(
                padding: EdgeInsets.only(top: 150, left: 30, right: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Амжилттай Төлөгдлөө",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF438883),
                          fontWeight: FontWeight.w600,
                          fontSize: 22,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Амжилттай Төлөгдлөө",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF666666),
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Color(0xFFFAFAFA),
                          borderRadius: BorderRadius.circular(25)),
                      child: Icon(
                        Icons.check_circle,
                        size: 30,
                        color: Color(0xFF438883),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
