// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_import
import 'HomePagePages/user_profile.dart';
import 'HomePagePages/trips_page_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                currentPageIndex = index;
              });
            },
            indicatorColor: Colors.amber,
            selectedIndex: currentPageIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'Availble Trips',
              ),
              NavigationDestination(
                icon: Icon(Icons.history),
                label: 'Trip History',
              ),
              NavigationDestination(
                icon: Icon(Icons.personal_injury),
                label: 'Profile',
              ),
            ]),
        appBar: AppBar(
          title: Text("Home Page"),
          centerTitle: true,
        ),
        body: Center(
          child: [TripsPage(), Text("page 2?"), Profile()][currentPageIndex],
        ));
  }
}
