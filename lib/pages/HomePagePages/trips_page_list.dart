// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/pages/HomePagePages/trip_card.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 5,
        itemBuilder: (context, snap) {
          return TripCard();
        });
  }
}
