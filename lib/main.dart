// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/pages/HomePagePages/trips_page_list.dart';
import 'package:untitled/pages/trip_page.dart';
import 'firebase_options.dart';
import 'package:untitled/pages/sign_up.dart';
import 'package:untitled/pages/sign_in.dart';
import 'package:untitled/pages/main_home_page.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:untitled/models/firebaseauth.dart';
import 'package:untitled/models/profile_sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Permission.locationWhenInUse.isDenied.then((value) {
    if (value) {
      Permission.locationWhenInUse.request();
    }
  });
  var isstoredprofile = await Profile.fetchprofile();
  var initialroute = '/SignIn';
  var cond = isstoredprofile == 'empty';
  if (cond) {
    print('empty');
  } else {
    initialroute = '/HomePage';
  }
  runApp(MyApp(initialroute: initialroute));
}

class MyApp extends StatelessWidget {
  MyApp({super.key, required this.initialroute});
  String initialroute;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: "Car Pool",
      initialRoute: '/SignIn',
      routes: {
        '/SignUp': (context) => SignUp(),
        '/SignIn': (context) => SignIn(),
        '/HomePage': (context) => HomePage(),
        '/TripPage': (context) => TripDetailsPage(),
      },
    );
  }
}
