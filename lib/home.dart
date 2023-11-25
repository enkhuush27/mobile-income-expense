import 'package:flutter/material.dart';
import './cons/header.dart';
import './cons/listTileCons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: Column(
          children: <Widget>[
            Stack(
              children: [
                Header(),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 60),
                      child: Text(
                        "Өглөөний мэнд?",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Б.Энхүүш",
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 20,
                  top: 60,
                  child: Icon(
                    Icons.notification_add_outlined,
                    color: Color(0xFFFFFFFF),
                    size: 40,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 120),
                        width: double.infinity,
                        height: 180,
                        decoration: const BoxDecoration(
                          color: Color(0xFF2F7E79),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 140, left: 20),
                        child: Column(
                          children: <Widget>[
                            Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Нийт үлдэгдэл",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFFF),
                                      fontWeight: FontWeight.w600),
                                ),
                                Icon(
                                  Icons.keyboard_arrow_up,
                                  color: Color(0xFFFFFFFF),
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  color: Color(0xFFFFFFFFF),
                                  size: 25,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\$ 5,232.00",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 28,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_downward_rounded,
                                  color: Color(0xFFFFFFFF),
                                  size: 20,
                                ),
                                Text(
                                  "Орлого",
                                  style: TextStyle(
                                    color: Color(0xCCFFFFFF),
                                    fontSize: 16,
                                  ),
                                ),
                                SizedBox(
                                  width: 150,
                                ),
                                Icon(
                                  Icons.arrow_upward_rounded,
                                  color: Color(0xFFFFFFFF),
                                  size: 20,
                                ),
                                Text(
                                  "Зарлага",
                                  style: TextStyle(
                                    color: Color(0xCCFFFFFF),
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "\$ 1,840.00",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFFF),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: 120,
                                ),
                                Text(
                                  "\$ 284.00",
                                  style: TextStyle(
                                      color: Color(0xFFFFFFFFF),
                                      fontSize: 22,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Гүйлгээний түүх",
                    style: TextStyle(
                        color: Color(0xFF222222),
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  Text(
                    "Бүгдийг харах",
                    style: TextStyle(
                      color: Color(0xFF666666),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            dListTile(),
          ],
        ),
      ),
    );
  }
}
