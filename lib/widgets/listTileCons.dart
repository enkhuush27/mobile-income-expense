import 'package:flutter/material.dart';

class dListTile extends StatefulWidget {
  const dListTile({super.key});

  @override
  State<dListTile> createState() => _dListTileState();
}

class _dListTileState extends State<dListTile> {
  var title = ["Upwork", "Facebook", "Paypal", "Youtube"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          decoration: BoxDecoration(
            color: Color(0xFFF0F6F5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Transform.scale(
            scale: 0.75,
            child: Image(
              alignment: Alignment.center,
              image: AssetImage(""),
              width: 50,
              height: 50,
            ),
          ),
        ),
        title: Text(""),
        subtitle: Text(
          "",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        trailing: Text(
          "",
          textAlign: TextAlign.end,
          style: TextStyle(
            color: Color(0xFF25A969),
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
