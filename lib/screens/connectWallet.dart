import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/screens/addExpense.dart';
import 'package:income_expense/widgets/body.dart';
import 'package:income_expense/widgets/bottomNav.dart';
import 'package:income_expense/widgets/header.dart';
import 'package:income_expense/widgets/textForm.dart';
import 'package:income_expense/screens/home.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class ConnectWallet extends StatefulWidget {
  ConnectWallet({super.key});

  @override
  State<ConnectWallet> createState() => _ConnectWalletState();
}

class _ConnectWalletState extends State<ConnectWallet> {
  bool isCvvFocused = false;

  @override
  Widget build(BuildContext context) {
    final TextEditingController _cardNumber = TextEditingController();
    final TextEditingController _expiryDate = TextEditingController();
    final TextEditingController _cardHolderName = TextEditingController();
    final TextEditingController _cvvCode = TextEditingController();
    final TextEditingController _zipCode = TextEditingController();
    CollectionReference cards =
        FirebaseFirestore.instance.collection('credit_cards');

    Future<void> addCards() async {
      try {
        await cards.add({
          'cardNumber': _cardNumber.text,
          'expiryDate': _expiryDate.text,
          'cardHolderName': _cardHolderName.text,
          'cvvCode': _cvvCode.text,
        });

        setState(() {
          _cardNumber.clear();
          _expiryDate.clear();
          _cardHolderName.clear();
          _cvvCode.clear();
        });

        print("Card added successfully");
      } catch (error) {
        print("Failed to add card: $error");
      }
    }

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
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
                  padding: EdgeInsets.only(top: 150, left: 30, right: 30),
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
                        Container(
                          height: 510,
                          child: TabBarView(
                            children: [
                              Column(
                                children: [
                                  CreditCardWidget(
                                    cardNumber: "xxxx xxxx xxxx xxxx",
                                    expiryDate: "05/24",
                                    cardHolderName: "Enkhuush",
                                    cvvCode: "723",
                                    showBackView: isCvvFocused,
                                    onCreditCardWidgetChange:
                                        (CreditCardBrand) {},
                                    cardBgColor:
                                        Color.fromRGBO(42, 124, 118, 1),
                                    cardType: CardType.visa,
                                    isSwipeGestureEnabled: true,
                                    bankName: "Wells Fargo",
                                    isHolderNameVisible: true,
                                  ),
                                  Text(
                                    "Картын мэдээллээ нэмэх",
                                    style: TextStyle(
                                        color: Color(0xFF000000),
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    "Энд холбох  карт нь зөвхөн  таны нэр дээр байх ёстой.",
                                    style: TextStyle(
                                        color: Color(0xFF666666),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                  Container(
                                    height: 230,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        TextForm(
                                          "Карт дээрх нэр",
                                          controller: _cardHolderName,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: TextForm(
                                                "Картын дугаар",
                                                controller: _cardNumber,
                                              ),
                                            ),
                                            Container(
                                              width: 125,
                                              child: TextForm(
                                                "CVC",
                                                controller: _cvvCode,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: 200,
                                              child: TextForm("Дуусах хугацаа",
                                                  controller: _expiryDate),
                                            ),
                                            Container(
                                              width: 125,
                                              child: TextForm(
                                                "ZIP",
                                                controller: _zipCode,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            addCards;
                                          },
                                          style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                            padding: EdgeInsets.all(0),
                                          ),
                                          child: Ink(
                                            decoration: BoxDecoration(
                                              color: Color(0xFFFFFFFF),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                color: Color(0xFF69AEA9),
                                              ),
                                            ),
                                            child: Container(
                                              constraints: BoxConstraints(
                                                minWidth: 100.0,
                                                minHeight: 70.0,
                                              ),
                                              alignment: Alignment.center,
                                              child: Text(
                                                "Баталгаажуулах",
                                                style: TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xFF69AEA9),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15,
                                        )
                                      ]),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 20),
                                height: 510,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Container(
                                        height: 80,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Color(0x1A438883)),
                                        child: ListTile(
                                          leading: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Transform.scale(
                                              scale: 0.85,
                                              child: Icon(
                                                Icons.account_balance,
                                                size: 30,
                                                color: Color(0xFF438883),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            "Bank Link",
                                            style: TextStyle(
                                                color: Color(0xFF438883),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          subtitle: Text(
                                            "Connect your bank account to deposit & fund",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF438883)),
                                          ),
                                          trailing: Icon(Icons.check_circle,
                                              color: Color(0xFF438883)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Container(
                                        height: 80,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Color(0x1A438883)),
                                        child: ListTile(
                                          leading: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Transform.scale(
                                              scale: 0.85,
                                              child: Icon(
                                                Icons.currency_bitcoin,
                                                size: 30,
                                                color: Color(0xFF888888),
                                              ),
                                            ),
                                          ),
                                          title: Text(
                                            "Microdeposits",
                                            style: TextStyle(
                                                color: Color(0xFF888888),
                                                fontWeight: FontWeight.w600),
                                          ),
                                          subtitle: Text(
                                            "Connect bank in 5-7 days",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF888888)),
                                          ),
                                          // trailing: Icon(Icons.check,
                                          //     color: Color(0xFF888888)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: Container(
                                        height: 80,
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            color: Color(0x1A438883)),
                                        child: ListTile(
                                          leading: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                            ),
                                            child: Transform.scale(
                                              scale: 0.85,
                                              child: Icon(
                                                Icons.paypal,
                                                size: 30,
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
                                          subtitle: Text(
                                            "Connect you paypal account",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Color(0xFF888888)),
                                          ),
                                          // trailing: Icon(Icons.check,
                                          //     color: Color(0xFF888888)),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 100,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                          MaterialPageRoute(
                                            builder: (context) => AddExpense(),
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        padding: EdgeInsets.all(0),
                                      ),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFFFFF),
                                          borderRadius:
                                              BorderRadius.circular(40),
                                          border: Border.all(
                                            color: Color(0xFF69AEA9),
                                          ),
                                        ),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            minWidth: 120.0,
                                            minHeight: 60.0,
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Дараах",
                                            style: TextStyle(
                                              fontSize: 24,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xFF69AEA9),
                                            ),
                                          ),
                                        ),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
