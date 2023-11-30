import 'package:flutter/material.dart';
import 'package:income_expense/widgets/header.dart';
import 'package:income_expense/widgets/bottomNav.dart';

class ChartScreen extends StatefulWidget {
  const ChartScreen({super.key});

  @override
  State<ChartScreen> createState() => _ChartScreenState();
}

class _ChartScreenState extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            BottomNav(),
            Header(),
          ],
        ),
      ),
    );
  }
}
