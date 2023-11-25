import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        width: 70,
        height: 70,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF438883),
          onPressed: () {},
          child: const Icon(Icons.add, size: 28),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFFFFFFFFF),
        shape: const CircularNotchedRectangle(),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.home), iconSize: 40),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.bar_chart_outlined),
              iconSize: 40),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.wallet_outlined),
              iconSize: 40),
          IconButton(onPressed: () {}, icon: Icon(Icons.person), iconSize: 40),
        ]),
      ),
    );
  }
}
