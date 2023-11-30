import 'package:flutter/material.dart';
import 'package:income_expense/cons/body.dart';
import 'package:income_expense/cons/bottomNav.dart';
import 'package:income_expense/cons/header.dart';
import 'package:income_expense/cons/rowDefault.dart';

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
                height: 700,
                child: SingleChildScrollView(
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
                        "Youtube Premium",
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
                      ExpansionTile(
                        title: Text("Гүйлгээний дэлгэрэнгүй"),
                        children: [
                          RowDefault("Төлбөрийн хэрэгсэл", "Дебит карт"),
                          SizedBox(
                            height: 10,
                          ),
                          RowDefault("Төлөв", "Хийгдсэн"),
                          SizedBox(
                            height: 10,
                          ),
                          RowDefault("Цаг", "08:15"),
                          SizedBox(
                            height: 10,
                          ),
                          RowDefault("Огноо", "Feb 22, 2022"),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Гүйлгээний дугаар",
                                style: TextStyle(
                                    color: Color(0xFF666666),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "23143242342032",
                                style: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                              ),
                              Icon(
                                Icons.copy,
                                size: 15,
                                color: Color(0xFF438883),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Divider(
                            color: Color(0xFF999999),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RowDefault("Үнэ", "\$ 11.99"),
                          SizedBox(
                            height: 10,
                          ),
                          RowDefault("Хураамж", "\$ 1.99"),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                        onExpansionChanged: (bool expanded) {},
                      ),
                      RowDefault("Нийт", "\$ 13.98"),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 90,
                        height: 90,
                        child: Image(
                          image: AssetImage("assets/qrcode.png"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            padding: EdgeInsets.all(0),
                          ),
                          child: Ink(
                            decoration: BoxDecoration(
                              color: Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(40),
                              border: Border.all(
                                color: Color(0xFF69AEA9),
                              ),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                minWidth: 80.0,
                                minHeight: 40.0,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Share Receipt",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF69AEA9),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
