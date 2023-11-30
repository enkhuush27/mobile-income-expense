import 'package:flutter/material.dart';
import 'package:income_expense/screens/billPayment.dart';
import 'package:income_expense/widgets/body.dart';
import 'package:income_expense/widgets/bottomNav.dart';
import 'package:income_expense/widgets/header.dart';

class BillDetails extends StatefulWidget {
  const BillDetails({super.key});

  @override
  State<BillDetails> createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          BottomNav(),
          Header(),
          Stack(
            children: [
              BodyContainer(),
              Container(
                height: 800,
                padding: EdgeInsets.only(top: 150, left: 30, right: 30),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                              color: Color(0xFFFAFAFA),
                              borderRadius: BorderRadius.circular(25)),
                          child: Transform.scale(
                              scale: 0.5,
                              child: Image(
                                  image: AssetImage('assets/logo-3.png'))),
                        ),
                        title: Text(
                          "Youtube Premium",
                          style: TextStyle(
                              color: Color(0xFF000000),
                              fontWeight: FontWeight.w600,
                              fontSize: 18),
                        ),
                        subtitle: Text(
                          "Feb 28, 2022",
                          style: TextStyle(
                              color: Color(0xFF666666),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Үнэ",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$ 11.99",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Хураамж",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$ 1,99",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(
                        color: Color(0xFF999999),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Нийт",
                            style: TextStyle(
                                color: Color(0xFF666666),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            "\$ 13.98",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        "Төлбөрийн хэрэгслээ сонго",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xFF000000),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0x1A438883)),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(25)),
                            child: Transform.scale(
                              scale: 0.6,
                              child: Image(
                                image: AssetImage('assets/credit-card.png'),
                                color: Color(0xFF438883),
                              ),
                            ),
                          ),
                          title: Text(
                            "Дебит карт",
                            style: TextStyle(
                                color: Color(0xFF438883),
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xFF438883),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            // child: Transform.scale(
                            //   scale: 0.5,
                            //   child: Icon(
                            //     Icons.circle_sharp,
                            //     size: 30,
                            //     color: Color(0xFF438883),
                            //   ),
                            // ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 80,
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Color(0x1A438883)),
                        child: ListTile(
                          leading: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                                color: Color(0xFFFAFAFA),
                                borderRadius: BorderRadius.circular(25)),
                            child: Transform.scale(
                              scale: 0.6,
                              child: Image(
                                image: AssetImage('assets/logo-2.png'),
                                color: Color(0xFF888888),
                              ),
                            ),
                          ),
                          title: Text(
                            "Paypal",
                            style: TextStyle(
                                color: Color(0xFF888888),
                                fontWeight: FontWeight.w600),
                          ),
                          trailing: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                  color: Color(0xFF888888),
                                  style: BorderStyle.solid),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => BillPayment(),
                          ));
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
                                minWidth: 120.0, minHeight: 60.0),
                            alignment: Alignment.center,
                            child: const Text(
                              "Төлөх",
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFFFFFFFF)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
