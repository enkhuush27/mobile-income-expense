import 'package:flutter/material.dart';

class dListTile extends StatelessWidget {
  const dListTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.facebook_outlined,
        size: 40,
        color: Colors.blue,
      ),
      title: Text(
        "Upwork",
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text("Өнөөдөр"),
      trailing: Text(
        "+ \$ 850.00",
        style: TextStyle(color: Color(0xFF25A969), fontSize: 18),
      ),
    );
  }
}
