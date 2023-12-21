// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/components/trip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/profile_sqflite.dart';

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
    var db = FirebaseFirestore.instance;
    db.settings = const Settings(
      persistenceEnabled: false,
    );

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

    return query.snapshots(includeMetadataChanges: true);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: streamerFirebase(),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data!.docs != []) {
          if (snapshot.data!.docs.isEmpty) {
            return Text("No Availble trips at the moment");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                DocumentSnapshot doc = snapshot.data!.docs[index];
                var status = 3;
                try {
                  if (doc['pending'].contains(SqfProfile.email)) {
                    status = 1;
                  } else if ((doc['accepted'].contains(SqfProfile.email))) {
                    status = 0;
                  } else if (doc['rejected'].contains(SqfProfile.email)) {
                    status = 2;
                  } else if (doc['completed'].contains(SqfProfile.email)) {
                    status = 4;
                  }
                } catch (err) {
                  print('error');
                }
                var t = DateTime.fromMicrosecondsSinceEpoch(
                    doc['date'].microsecondsSinceEpoch);
                return TripCard(
                  TripID: doc.id,
                  date: ' ${t.day}/${t.month}/${t.year}',
                  time: doc['type'] == "AM" ? "5:30" : "7:30",
                  gate: doc['gate'],
                  location: doc['location'],
                  driver: doc['driver'],
                  map: '1',
                  type: doc['type'],
                  status: status,
                  cost: doc['cost'],
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
