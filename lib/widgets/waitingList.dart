import 'package:flutter/material.dart';
import 'package:income_expense/screens/connectWallet.dart';

class WaitList extends StatefulWidget {
  const WaitList({super.key});

  @override
  State<WaitList> createState() => _WaitListState();
}

class _WaitListState extends State<WaitList> {
  var title = ["Upwork", "Facebook", "Paypal", "Youtube"];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, index) => ListTile(
          leading: Container(
            decoration: BoxDecoration(
              color: Color(0xFFF0F6F5),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Transform.scale(
              scale: 0.75,
              child: Image(
                alignment: Alignment.center,
                image: AssetImage("assets/logo-$index.png"),
                width: 50,
                height: 50,
              ),
            ),
          ),
          title: Text(title[index]),
          subtitle: Text(
            "Өнөөдөр",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          trailing: Container(
            width: 90,
            height: 35,
            decoration: BoxDecoration(
              color: Color(0xFFECF9F8),
              borderRadius: BorderRadius.circular(20),
            ),
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ConnectWallet(),
                ));
              },
              child: Text(
                "Төлөх",
                style: TextStyle(color: Color(0xFF438883), fontSize: 16),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
