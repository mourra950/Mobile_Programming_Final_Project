// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:untitled/components/trip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/models/profile_sqflite.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  Stream<QuerySnapshot> streamerFirebase() {
    var db = FirebaseFirestore.instance;
    db.settings = const Settings(
      persistenceEnabled: false,
    );

    var query = db.collection('Trips').where(Filter.or(
        Filter('pending', arrayContains: SqfProfile.email),
        Filter('rejected', arrayContains: SqfProfile.email),
        Filter('completed', arrayContains: SqfProfile.email),
        Filter('accepted', arrayContains: SqfProfile.email)));
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
                var status;
                if (doc['pending'].contains(SqfProfile.email)) {
                  status = 1;
                } else if ((doc['accepted'].contains(SqfProfile.email))) {
                  status = 0;
                } else if (doc['rejected'].contains(SqfProfile.email)) {
                  status = 2;
                } else if (doc['completed'].contains(SqfProfile.email)) {
                  status = 4;
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
  }
}
