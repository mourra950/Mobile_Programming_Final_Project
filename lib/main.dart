// ignore_for_file: prefer_const_constructors, unused_import
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:untitled/pages/SignUp.dart';
import 'package:untitled/pages/SignIn.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      title: "Car Pool",
      initialRoute: '/SignUp',
      routes: {
        '/SignUp': (context) => SignUp(),
      },
    );
  }
}
