// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 50,
          child: Icon(
            Icons.person,
            size: 50,
          ),
        ),
        SizedBox(
            width: 370,
            height: 200,
            child: Card(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('name'),
                    Text('email'),
                    Text('phone'),
                  ]),
            )),
        Container(
          child: Column(
            children: [
              ElevatedButton(onPressed: () {}, child: Text('Sign out')),
              ElevatedButton(onPressed: () {}, child: Text('Delete Account')),
              ElevatedButton(
                  onPressed: () {}, child: Text('Visit Dev profile')),
            ],
          ),
        )
      ],
    );
  }
}
