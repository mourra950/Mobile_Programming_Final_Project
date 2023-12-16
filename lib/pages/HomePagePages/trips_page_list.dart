// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/components/trip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  Stream<QuerySnapshot> streamerFirebase() {
    DateTime now = DateTime.now();
    DateTime deadline730 = DateTime(now.year, now.month, now.day, 22, 0, 0);
    DateTime deadline530 = DateTime(now.year, now.month, now.day, 13, 0, 0);
    Timestamp Dead1 = Timestamp.fromDate(deadline730);
    var db = FirebaseFirestore.instance;

    // Combine the two queries using `||` (logical OR)
    var query = db.collection('Trips').where(
          Filter.or(
            Filter.and(
              Filter('date', isGreaterThan: deadline730),
              Filter('type', isEqualTo: 'AM'),
            ),
            Filter.and(
              Filter('date', isGreaterThan: deadline530),
              Filter('type', isEqualTo: 'PM'),
            ),
          ),
        );

    return query.snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamerFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                print(doc['date']);
                var t = doc['date'];
                print(t.runtimeType);

                print(t);
                return TripCard(
                  TripID: '1',
                  date: '1',
                  time: '1',
                  to: '1',
                  from: '1',
                );
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
