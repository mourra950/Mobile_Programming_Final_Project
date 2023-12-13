// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TripCard extends StatefulWidget {
  const TripCard({super.key});

  @override
  State<TripCard> createState() => _TripCardState();
}

class _TripCardState extends State<TripCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Icon(Icons.abc),
        trailing: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
      ),
    );
  }
}
