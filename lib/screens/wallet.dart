import 'package:flutter/material.dart';
import 'package:income_expense/model/ExpenseDetails.dart';
import 'package:income_expense/screens/connectWallet.dart';
import 'package:income_expense/widgets/bottomNav.dart';
import 'package:income_expense/widgets/header.dart';
import 'package:income_expense/widgets/listTileCons.dart';
import 'package:income_expense/widgets/waitingList.dart';
import 'package:income_expense/screens/home.dart';

class WalletScreen extends StatefulWidget {
  final ExpenseDetails? expenseDetails;
  final String? iconPath;
  final int? balance;
  const WalletScreen({
    Key? key,
    this.expenseDetails,
    this.iconPath,
    this.balance,
  }) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFFFFFFF),
        body: Stack(children: [
          BottomNav(),
          Header(),
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
                    "Түрийвч",
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
          Container(
            width: double.infinity,
            height: 580,
            margin: EdgeInsets.only(top: 130),
            decoration: const BoxDecoration(
              color: Color(0xFFFFFFFFF),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Нийт үлдэгдэл",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "\$ ${widget.balance}",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w700,
                        fontSize: 30),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFF549994)),
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => ConnectWallet(),
                                    ),
                                  );
                                },
                                icon: Icon(Icons.add, size: 30),
                                color: Color(0xFF549994),
                              ),
                            ),
                            Text("Нэмэх")
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFF549994)),
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.qr_code, size: 30),
                                color: Color(0xFF549994),
                              ),
                            ),
                            Text("Төлөх")
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Color(0xFF549994)),
                                  borderRadius: BorderRadius.circular(25)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.send, size: 30),
                                color: Color(0xFF549994),
                              ),
                            ),
                            Text("Илгээх")
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DefaultTabController(
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
                                  "Гүйлгээнүүд",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF666666),
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Хүлээгдэж буй гүйлгээ",
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
                        Container(
                          height: 300,
                          child: TabBarView(
                            children: [
                              Container(child: dListTile()),
                              Container(
                                  child: WaitList(
                                expenseDetails: widget
                                    .expenseDetails, // Pass received expenseDetails
                                iconPath:
                                    widget.iconPath ?? 'assets/default.png',
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
