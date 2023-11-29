import 'package:flutter/material.dart';
import 'package:income_expense/cons/body.dart';
import 'package:income_expense/cons/bottomNav.dart';
import 'package:income_expense/cons/header.dart';

class BillPayment extends StatefulWidget {
  const BillPayment({super.key});

  @override
  State<BillPayment> createState() => _BillPaymentState();
}

class _BillPaymentState extends State<BillPayment> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BottomNav(),
        Header(),
        Stack(
          children: [BodyContainer()],
        )
      ],
    );
  }
}
