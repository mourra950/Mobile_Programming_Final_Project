// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/pages/HomePagePages/trip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    var db = FirebaseFirestore.instance;
    db.settings = const Settings(
      persistenceEnabled: false,
    );
    return StreamBuilder<QuerySnapshot>(
      stream: db.collection('userinfo').snapshots(
            includeMetadataChanges: true,
          ),
      builder: (context, snapshot) {
        print(snapshot);
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                return TripCard();
              });
        } else {
          return Text("Loading.... ");
        }
      },
    );
//  return StreamBuilder(
//     stream: FirebaseFirestore.instance.collection("collection").snapshots(),
//     builder: (context, snapshot) {
//       if (!snapshot.hasData) {
//         return Text(
//           'No Data...',
//         );
//       } else {
//           <DocumentSnapshot> items = snapshot.data!.documents;

//           return ListView.builder(
//         itemCount: 5,
//         itemBuilder: (context, snap) {
//           return TripCard();
//         });
//       }

//   });
  }
}
