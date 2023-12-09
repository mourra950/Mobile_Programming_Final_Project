import 'package:flutter/material.dart';
import 'package:untitled/homepage.dart';
import 'package:untitled/Signin.dart';
import 'package:untitled/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

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
      title: "Car Pool",
      initialRoute: '/Signin',
      routes: {
        '/Signin': (context) => Signin(),
      },
    );
  }
}
