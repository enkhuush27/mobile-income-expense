// ignore_for_file: unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/model/ExpenseDetails.dart';
import 'package:intl/intl.dart';
import 'package:income_expense/screens/wallet.dart';
import 'package:income_expense/widgets/header.dart';

const List<String> list = ['Netflix', "Youtube", "Upwork"];

class AddExpense extends StatefulWidget {
  const AddExpense({Key? key}) : super(key: key);

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  late TextEditingController _dateController;
  late TextEditingController _amountController;
  String dropdownValue = list.first;

  Map<String, String> iconMapping = {
    'Netflix': 'assets/netflix.png',
    'Youtube': 'assets/youtube.png',
    'Upwork': 'assets/upwork.png',
  };

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController();
    _amountController = TextEditingController();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      String formattedDate = DateFormat("d MMM yyyy").format(picked);
      _dateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xFFFFFFFF),
        body: Stack(
          children: [
            Header(),
            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 100, left: 30, right: 30),
                  child: Container(
                    height: 550,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 2,
                              offset: Offset(-2, 2))
                        ],
                        color: Color(0xFFFFFFFF)),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Гүйлгээний нэр",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            DropdownButtonFormField(
                              value: dropdownValue,
                              icon: Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              decoration: InputDecoration(
                                prefixIcon: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Image.asset(
                                    iconMapping[dropdownValue] ??
                                        'assets/default.png',
                                    width: 50,
                                    height: 50,
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500,
                              ),
                              onChanged: (String? value) {
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list.map<DropdownMenuItem<String>>(
                                (String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                },
                              ).toList(),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Үнийн дүн",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _amountController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFFDDDDDD),
                                  ),
                                ),
                                labelStyle: TextStyle(color: Color(0xFFDDDDDD)),
                                fillColor: Color(0xFFFFFFFF),
                                hintText: "\$ 0.00",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF438883),
                                  ),
                                ),
                              ),
                              style: TextStyle(color: Color(0xFF438883)),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Огноо",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextField(
                              controller: _dateController,
                              readOnly: true,
                              onTap: () => _selectDate(context),
                              decoration: InputDecoration(
                                suffixIcon: Icon(Icons.calendar_today),
                                hintText: "Tue, 22 Feb 2022",
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)),
                                  borderSide: BorderSide(
                                    color: Color(0xFF438883),
                                  ),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFDDDDDD),
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Төлбөр",
                              style: TextStyle(
                                color: Color(0xFF666666),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            InkWell(
                              child: DottedBorder(
                                color: Color(0xFFDDDDDD),
                                padding: EdgeInsets.all(15),
                                borderType: BorderType.RRect,
                                radius: Radius.circular(10),
                                dashPattern: [8],
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_circle,
                                        color: Color(0xFF666666)),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Төлбөр нэмэх",
                                      style: TextStyle(
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xFF666666)),
                                    )
                                  ],
                                ),
                              ),
                              onTap: () async {
                                String expenseName = dropdownValue;
                                String expenseAmount = _amountController.text;
                                String expenseDate = _dateController.text;
                                String expenseStatus = "Pending";

                                CollectionReference bills = FirebaseFirestore
                                    .instance
                                    .collection('bill');

                                Map<String, dynamic> expenseData = {
                                  'platform': expenseName,
                                  'amount': expenseAmount,
                                  'date': expenseDate,
                                  'status': expenseStatus,
                                };
                                try {
                                  await bills.add(expenseData);

                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WalletScreen()),
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content:
                                            Text('Expense added successfully')),
                                  );

                                  _amountController.clear();
                                  _dateController.clear();
                                  setState(() {
                                    dropdownValue = list.first;
                                  });
                                } catch (e) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text('Failed to add expense')),
                                  );
                                  print('Error: $e');
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
