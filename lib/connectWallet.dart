import 'package:flutter/material.dart';
import 'package:income_expense/cons/body.dart';
import 'package:income_expense/cons/bottomNav.dart';
import 'package:income_expense/cons/header.dart';
import 'package:income_expense/cons/listTileCons.dart';
import 'package:income_expense/cons/waitingList.dart';
import 'package:income_expense/home.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class ConnectWallet extends StatefulWidget {
  const ConnectWallet({super.key});

  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            BottomNav(),
            Header(),
            Stack(
              children: <Widget>[
                BodyContainer(),
                Padding(
                  padding: EdgeInsets.only(top: 40),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 28,
                            )),
                        Text(
                          "Түрийвч цэнэглэх",
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                              color: Colors.white),
                        ),
                        Icon(
                          Icons.notification_add_outlined,
                          color: Color(0xFFFFFFFF),
                          size: 30,
                        ),
                      ]),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 160, left: 40, right: 40),
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFF4F6F6),
                            borderRadius: BorderRadius.circular(60),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: TabBar(
                            tabs: [
                              Tab(
                                child: Text(
                                  "Картууд",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Аккаунт",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Color(0xFF666666),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                            indicator: BoxDecoration(
                              border: Border.all(
                                color: Color(0xFFFFFFFF),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(60),
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
