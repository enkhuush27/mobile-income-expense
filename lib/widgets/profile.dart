import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage("assets/person-0.png"),
          radius: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/person-1.png"),
          radius: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/person-2.png"),
          radius: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/person-3.png"),
          radius: 30,
        ),
        CircleAvatar(
          backgroundImage: AssetImage("assets/person-4.png"),
          radius: 30,
        ),
      ],
    );
  }
}
