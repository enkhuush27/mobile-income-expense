import 'package:flutter/material.dart';
import 'package:income_expense/chart.dart';
import 'package:income_expense/home.dart';
import 'package:income_expense/wallet.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ChartScreen(),
                  ));
                },
                icon: Icon(Icons.bar_chart_outlined),
                iconSize: 45,
                color: Color(0xFFAAAAAA),
              ),
              IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WalletScreen(),
                  ));
                },
                icon: Icon(Icons.wallet_outlined),
                iconSize: 45,
                color: Color(0xFFAAAAAA),
              ),
              IconButton(
                onPressed: () {
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => WalletScreen(),
                  // ));
                },
                icon: Icon(Icons.person),
                iconSize: 45,
                color: Color(0xFFAAAAAA),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
