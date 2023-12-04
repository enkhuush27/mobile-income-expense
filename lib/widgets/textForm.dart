import 'package:flutter/material.dart';

class TextForm extends StatefulWidget {
  final String lbl;
  const TextForm(this.lbl, {super.key});

  @override
  State<TextForm> createState() => _TextFormState();
}

class _TextFormState extends State<TextForm> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xFFDDDDDD),
          ),
        ),
        labelText: widget.lbl,
        labelStyle: TextStyle(color: Color(0xFFDDDDDD)),
        fillColor: Color(0xFFFFFFFF),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Color(0xFF438883),
          ),
        ),
      ),
      style: TextStyle(color: Color(0xFF438883)),
    );
  }
}
