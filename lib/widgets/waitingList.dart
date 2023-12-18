import 'package:flutter/material.dart';
import 'package:income_expense/model/ExpenseDetails.dart';
import 'package:income_expense/screens/connectWallet.dart';

class WaitList extends StatelessWidget {
  final ExpenseDetails? expenseDetails;

  const WaitList({Key? key, this.expenseDetails}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF0F6F5),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Image.asset(
          "",
          width: 50,
          height: 50,
        ),
      ),
      title: Text(""),
      subtitle: Text(
        "",
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
    );
  }
}
