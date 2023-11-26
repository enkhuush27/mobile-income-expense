import 'package:flutter/material.dart';

class BodyContainer extends StatelessWidget {
  const BodyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 600,
      margin: EdgeInsets.only(top: 130),
      decoration: const BoxDecoration(
        color: Color(0xFFFFFFFFF),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
    );
  }
}
