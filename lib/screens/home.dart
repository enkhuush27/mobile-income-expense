// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/screens/addExpense.dart';
import 'package:income_expense/screens/chart.dart';
import 'package:income_expense/widgets/profile.dart';
import 'package:income_expense/screens/wallet.dart';
import 'package:income_expense/widgets/header.dart';
import 'package:income_expense/widgets/listTileCons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? balance = 0;
  int? income = 0;
  int? expense = 0;

  @override
  void initState() {
    super.initState();
    fetchBalanceFromFirestore();
  }

  Future<void> fetchBalanceFromFirestore() async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('account')
          .doc('accounts')
          .get();

      if (snapshot.exists) {
        setState(() {
          balance = snapshot['total'] ?? 0;
          income = snapshot['income'] ?? 0;
          expense = snapshot['expense'] ?? 0;
        });
      } else {
        print('Document does not exist');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

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
                          boxShadow: [
                            BoxShadow(
                                color: Color(0x402F7E79),
                                offset: Offset(0, 10),
                                blurRadius: 4)
                          ],
                          color: Color(0xFF2F7E79),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 140, left: 20, right: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Нийт үлдэгдэл",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFFF),
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Color(0xFFFFFFFF),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  color: Color(0xFFFFFFFFF),
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ $balance",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Color(0xFFFFFFFF),
                                  size: 20,
                                ),
                                Text(
                                  "Орлого",
                                  style: TextStyle(
                                    color: Color(0xCCFFFFFF),
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Icon(
                                  Icons.arrow_upward_rounded,
                                  color: Color(0xFFFFFFFF),
                                  size: 20,
                                ),
                                Text(
                                  "Зарлага",
                                  style: TextStyle(
                                    color: Color(0xCCFFFFFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$ $income",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFFF),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  textAlign: TextAlign.end,
                                  "\$ $expense",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFFF),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Гүйлгээний түүх",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    "Бүгдийг харах",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Container(height: 230),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Send Again",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Stack(
              children: [
                Profile(),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          width: 65,
          height: 65,
          child: FloatingActionButton(
            backgroundColor: Color(0xFF438883),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AddExpense(),
                ),
              );
            },
            child: const Icon(Icons.add, size: 28),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Color(0xFFFFFFFFF),
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.home),
                iconSize: 45,
                color: Color(0xFF549994),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => ChartScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.bar_chart_outlined),
                iconSize: 45,
                color: Color(0xFFAAAAAA),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WalletScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.wallet_outlined),
                iconSize: 45,
                color: Color(0xFFAAAAAA),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => WalletScreen(),
                      ),
                    );
                  },
                  icon: Icon(Icons.person),
                  iconSize: 45,
                  color: Color(0xFFAAAAAA)),
            ],
          ),
        ),
      ),
    );
  }
}
