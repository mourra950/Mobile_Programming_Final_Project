import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/signin.dart';
import 'package:untitled/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Car Pool",
      home: signin(),
    );
  }
}
