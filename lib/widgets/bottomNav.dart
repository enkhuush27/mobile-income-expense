import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/screens/chart.dart';
import 'package:income_expense/screens/home.dart';
import 'package:income_expense/screens/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index_color = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xFFAAAAAA),
              blurRadius: 10,
            ),
          ],
        ),
        child: BottomAppBar(
          elevation: 10,
          color: Color(0xFFFFFFFFF),
          shape: const CircularNotchedRectangle(),
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
                icon: Icon(Icons.home),
                iconSize: 45,
                color: Color(0xFFAAAAAA),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index_color = 1;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChartScreen(),
                  ));
                },
                icon: Icon(Icons.bar_chart_outlined),
                iconSize: 45,
                color: index_color == 1 ? Color(0xFF2F7E79) : Color(0xFFAAAAAA),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index_color = 2;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WalletScreen(),
                  ));
                },
                icon: Icon(Icons.wallet_outlined),
                iconSize: 45,
                color: index_color == 2 ? Color(0xFF2F7E79) : Color(0xFFAAAAAA),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    index_color = 3;
                  });
                },
                icon: Icon(Icons.person),
                iconSize: 45,
                color: index_color == 3 ? Color(0xFF2F7E79) : Color(0xFFAAAAAA),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
