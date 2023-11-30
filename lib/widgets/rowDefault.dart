import 'package:flutter/material.dart';

class RowDefault extends StatefulWidget {
  final String first, last;
  const RowDefault(this.first, this.last, {super.key});

  @override
  State<RowDefault> createState() => _RowDefaultState();
}

class _RowDefaultState extends State<RowDefault> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          widget.first,
          style: TextStyle(
              color: Color(0xFF666666),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
        Text(
          widget.last,
          style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 16,
              fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
