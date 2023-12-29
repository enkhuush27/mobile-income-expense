import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/model/ExpenseDetails.dart';
import 'package:income_expense/screens/billDetails.dart';
import 'package:income_expense/screens/connectWallet.dart';
import 'package:income_expense/widgets/bottomNav.dart';
import 'package:income_expense/widgets/header.dart';
import 'package:income_expense/widgets/listTileCons.dart';
import 'package:income_expense/widgets/waitingList.dart';
import 'package:income_expense/screens/home.dart';

class WalletScreen extends StatefulWidget {
  final String? date;
  final String? platform;
  const WalletScreen({this.date, this.platform, super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  int? balance = 0;
  int? income = 0;
  int? expense = 0;

  Map<String, String> iconMapping = {
    'Netflix': 'assets/netflix.png',
    'Youtube': 'assets/youtube.png',
    'Upwork': 'assets/upwork.png',
  };

  CollectionReference bills = FirebaseFirestore.instance.collection('bill');

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
                    "\$ ${balance}",
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
                              Container(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('bill')
                                      .where('platform',
                                          isEqualTo: widget.platform)
                                      .where('date', isEqualTo: widget.date)
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }

                                    if (snapshot.hasData &&
                                        snapshot.data!.docs.isNotEmpty) {
                                      var updatedPayment =
                                          snapshot.data!.docs.first;
                                      String platform =
                                          updatedPayment['platform'];
                                      String amount = updatedPayment['amount'];
                                      String date = updatedPayment['date'];
                                      String status = updatedPayment['status'];

                                      return ListTile(
                                        leading: Container(
                                          decoration: BoxDecoration(
                                            color: Color(0xFFF0F6F5),
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: Transform.scale(
                                            scale: 0.75,
                                            child: Image(
                                              alignment: Alignment.center,
                                              image: AssetImage(
                                                  iconMapping[platform] ??
                                                      'assets/default.png'),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                        title: Text(platform),
                                        subtitle: Text(
                                          '$date',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400),
                                        ),
                                        trailing: Text(
                                          "\$ ${amount}",
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            color: Color(0xFF25A969),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      );
                                    } else {
                                      return Text('No updated data found.');
                                    }
                                  },
                                ),
                              ),
                              Container(
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('bill')
                                      .snapshots(),
                                  builder: (BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    if (snapshot.hasError) {
                                      return Text('Error: ${snapshot.error}');
                                    }

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return CircularProgressIndicator();
                                    }

                                    if (snapshot.hasData &&
                                        snapshot.data!.docs.isNotEmpty) {
                                      return ListView.builder(
                                        itemCount: snapshot.data!.docs.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          var expense =
                                              snapshot.data!.docs[index];
                                          String platform = expense['platform'];
                                          String amount = expense['amount'];
                                          String date = expense['date'];
                                          String status = expense['status'];

                                          return ListTile(
                                            leading: Container(
                                              decoration: BoxDecoration(
                                                color: Color(0xFFF0F6F5),
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                              child: Image.asset(
                                                iconMapping[platform] ??
                                                    'assets/default.png',
                                                width: 50,
                                                height: 50,
                                              ),
                                            ),
                                            title: Text(platform),
                                            subtitle: Text(
                                              '$date',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            trailing: Container(
                                              width: 90,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                color: Color(0xFFECF9F8),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              alignment: Alignment.center,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.of(context)
                                                      .push(MaterialPageRoute(
                                                    builder: (context) =>
                                                        BillDetails(
                                                      status: status,
                                                      date: date,
                                                      platform: platform,
                                                      total: amount,
                                                    ),
                                                  ));
                                                },
                                                child: Text(
                                                  'Төлөх',
                                                  style: TextStyle(
                                                      color: Color(0xFF438883),
                                                      fontSize: 16),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      );
                                    } else {
                                      return Text('No expenses found.');
                                    }
                                  },
                                ),
                              ),
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
