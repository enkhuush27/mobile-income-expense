import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:income_expense/cons/header.dart';
import 'package:income_expense/cons/DatePickerTextField.dart';

const List<String> list = ['Netflix', "Youtube", "Upwork"];

class AddExpense extends StatefulWidget {
  const AddExpense({super.key});

  @override
  State<AddExpense> createState() => _AddExpenseState();
}

class _AddExpenseState extends State<AddExpense> {
  String dropdownValue = list.first;
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
                              icon: const Icon(Icons.arrow_drop_down),
                              elevation: 16,
                              decoration: InputDecoration(
                                  prefixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Image.asset(
                                      'assets/netflix.png',
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              style: const TextStyle(
                                  color: Color(0xFF666666),
                                  fontWeight: FontWeight.w500),
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
                              }).toList(),
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
                            TextFormField(
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
                            DatePickerTextField(),
                            // TextFormField(
                            //   decoration: InputDecoration(
                            //     border: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(10)),
                            //       borderSide: BorderSide(
                            //         color: Color(0xFFDDDDDD),
                            //       ),
                            //     ),
                            //     labelStyle: TextStyle(color: Color(0xFFDDDDDD)),
                            //     fillColor: Color(0xFFFFFFFF),
                            //     hintText: "Tue, 22 Feb 2022",
                            //     suffixIcon: Icon(Icons.calendar_today),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius:
                            //           BorderRadius.all(Radius.circular(10)),
                            //       borderSide: BorderSide(
                            //         color: Color(0xFF438883),
                            //       ),
                            //     ),
                            //   ),
                            //   style: TextStyle(color: Color(0xFF438883)),
                            // ),
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
                                dashPattern: [6],
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
                              onTap: () {},
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
