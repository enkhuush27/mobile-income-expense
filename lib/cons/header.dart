import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 250,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF429690), Color(0xFF2A7C76)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(160, 30),
                bottomRight: Radius.elliptical(160, 30),
              ),
            ),
          ),
          Positioned(
            left: 100,
            top: -20,
            child: Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0x26FFFFFF),
                  width: 10.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: 30,
            child: Container(
              width: 110,
              height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0x1AFFFFFF),
                  width: 10.0,
                ),
              ),
            ),
          ),
          Positioned(
            left: -30,
            top: 20,
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Color(0x0DFFFFFF),
                  width: 10.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
