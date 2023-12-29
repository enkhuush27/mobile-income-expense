import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/screens/billPayment_2.dart';
import 'package:income_expense/screens/wallet.dart';
import 'package:income_expense/widgets/body.dart';
import 'package:income_expense/widgets/bottomNav.dart';
import 'package:income_expense/widgets/header.dart';

class BillPayment extends StatefulWidget {
  final String total;
  final String status;
  final String date;
  final String platform;
  const BillPayment(
      {super.key,
      required this.total,
      required this.status,
      required this.platform,
      required this.date});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  Map<String, String> iconMapping = {
    'Netflix': 'assets/netflix.png',
    'Youtube': 'assets/youtube.png',
    'Upwork': 'assets/upwork.png',
  };

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
                Padding(
                  padding: EdgeInsets.only(top: 150, left: 30, right: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0xFFFAFAFA),
                            borderRadius: BorderRadius.circular(30)),
                        child: Transform.scale(
                            scale: 0.8,
                            child: Image(
                                image: AssetImage(
                                    iconMapping[widget.platform] ??
                                        'assets/default.png'))),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "You will play ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.black),
                          ),
                          Text(
                            "${widget.platform}",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF438883)),
                          ),
                        ],
                      ),
                      Text(
                        "for one month with BCA OneKlik",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: 30,
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
                            "\$ ${widget.total}",
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
                            "\$ 0",
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
                            "\$ ${widget.total}",
                            style: TextStyle(
                                color: Color(0xFF000000),
                                fontWeight: FontWeight.w500,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          CollectionReference bills =
                              FirebaseFirestore.instance.collection('bill');

                          QuerySnapshot querySnapshot = await bills
                              .where('platform', isEqualTo: widget.platform)
                              .where('date', isEqualTo: widget.date)
                              .get();

                          if (querySnapshot.docs.isNotEmpty) {
                            querySnapshot.docs.forEach((doc) {
                              doc.reference
                                  .update({'status': 'PAID'}).then((value) {
                                print('Document updated successfully!');
                              }).catchError((error) {
                                print('Failed to update document: $error');
                              });
                            });
                          } else {
                            print('Document not found!');
                          }
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => WalletScreen(
                                date: widget.date,
                                platform: widget.platform,
                              ),
                            ),
                          );
                          DocumentSnapshot accountDoc = await FirebaseFirestore
                              .instance
                              .collection('account')
                              .doc('accounts')
                              .get();

                          int currentTotal = accountDoc['total'] ?? 0;

                          int newTotal = currentTotal - int.parse(widget.total);
                          await FirebaseFirestore.instance
                              .collection('account')
                              .doc('accounts')
                              .update({'total': newTotal}).then((_) {
                            print('Expense subtracted successfully!');

                            setState(() {});
                          }).catchError((error) {
                            print('Failed to subtract expense: $error');
                          });
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
                              "Баталгаажуулах",
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
              ],
            )
          ],
        ),
      ),
    );
  }
}
