// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/pages/HomePagePages/trips_page_list.dart';
import 'package:untitled/pages/trip_page.dart';
import 'package:untitled/pages/sign_up.dart';
import 'package:untitled/pages/sign_in.dart';
import 'package:untitled/pages/main_home_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/models/firebaseauth.dart';
import 'package:untitled/models/profile_sqflite.dart';
import 'package:untitled/utils/snack_bar.dart';
import 'package:url_launcher/link.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String profileName;
  late String profileEmail;
  late int profilemoney;
  late int profilevirtualmoney;

  late String profilePhone;
  final Uri _url = Uri.parse('https://mourra950.github.io/Portofolio/');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  void signOut() async {
    var temp = await FBase.signOut();
    if (temp == 'Signed Out') {
      SBar.showSnackBar(context: context, message: 'Signed Out');
      Navigator.pushReplacementNamed(context, '/SignIn');
    } else {
      SBar.showSnackBar(context: context, message: temp);
    }
  }

  @override
  void initState() {
    profileName = SqfProfile.name;
    profileEmail = SqfProfile.email;
    profilePhone = SqfProfile.phone;
    profilemoney = SqfProfile.money;
    profilevirtualmoney = SqfProfile.virtualmoney;

    super.initState();
  }

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
                    Text(profileName),
                    Text(profileEmail),
                    Text('Money $profilemoney'),
                    Text('Virtual Balance $profilevirtualmoney'),
                    Text(profilePhone),
                  ]),
            )),
        Container(
          child: Column(
            children: [
              ElevatedButton(
                  onPressed: () {
                    signOut();
                  },
                  child: Text('Sign out')),
              ElevatedButton(
                  onPressed: () async {
                    await _launchUrl();
                  },
                  child: Text('Visit Dev profile')),
            ],
          ),
        )
      ],
    );
  }
}
