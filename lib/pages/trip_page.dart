// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:untitled/models/profile_sqflite.dart';
import 'package:untitled/utils/booking.dart';

class TripDetailsPage extends StatefulWidget {
  const TripDetailsPage({super.key});

  @override
  State<TripDetailsPage> createState() => _TripDetailsPageState();
}

class _TripDetailsPageState extends State<TripDetailsPage> {
  Stream<QuerySnapshot> streamerFirebase() {
    var db = FirebaseFirestore.instance;
    db.settings = const Settings(
      persistenceEnabled: false,
    );

    var query = db.collection('Trips').where(Filter.or(
        Filter('pending', arrayContains: SqfProfile.email),
        Filter('rejected', arrayContains: SqfProfile.email),
        Filter('accepted', arrayContains: SqfProfile.email)));

    return query.snapshots();
  }

  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  String bookingstate = "";

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trip Details"),
        centerTitle: true,
      ),
      body: Center(
        //   StreamBuilder(
        // stream: FirebaseFirestore.instance
        //     .collection('Trips')
        //     .doc(arguments['TripID'])
        //     .snapshots(),
        // builder: (context, snapshot) {
        //   if (snapshot.hasError) {
        //     return Center(
        //       child: Text('Error: ${snapshot.error}'),
        //     );
        //   }

        //   if (!snapshot.hasData || !snapshot.data!.exists) {
        //     return Center(
        //       child: Text('Document does not exist'),
        //     );
        //   }
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Trips')
                .doc(arguments['TripID'])
                .snapshots(includeMetadataChanges: true),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              }

              if (!snapshot.hasData || !snapshot.data!.exists) {
                return Center(
                  child: Text('Document does not exist'),
                );
              }
              Widget button;
              List<dynamic> arrayValues = [];
              arrayValues = [
                snapshot.data!.get('pending'),
                snapshot.data!.get('accepted'),
                snapshot.data!.get('rejected')
              ];

              if (arrayValues[0].contains(SqfProfile.email)) {
                button = buttonShow(arguments, 0);
              } else if (arrayValues[1].contains(SqfProfile.email)) {
                button = buttonShow(arguments, 1);
              } else if (arrayValues[2].contains(SqfProfile.email)) {
                button = buttonShow(arguments, 2);
              } else {
                button = buttonShow(arguments, 3);
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: double.infinity,
                        height: 400,
                        child: GoogleMap(
                            onMapCreated: _onMapCreated,
                            initialCameraPosition: CameraPosition(
                              target: _center,
                              zoom: 11.0,
                            ))),
                    ListTile(
                        title: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                          Text(arguments['driver'],
                              textAlign: TextAlign.center),
                          Text('${arguments['date']}',
                              textAlign: TextAlign.center),
                          Text(' ${arguments['time']}',
                              textAlign: TextAlign.center),
                          Text(
                              'Location ${arguments['location']}\nGate ${arguments['gate']}',
                              textAlign: TextAlign.center),
                          Text('Trip ID ${arguments['TripID']}',
                              textAlign: TextAlign.center),
                          Text('Trip Cost ${arguments["cost"]}',
                              textAlign: TextAlign.center),
                        ])),
                    Padding(
                      padding: const EdgeInsets.all(60.0),
                      child: button,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }

  // Widget Bookingbutton(Map<dynamic, dynamic> arguments) {
  //   t(arguments);
  // }

  // StreamBuilder<DocumentSnapshot<Map<String, dynamic>>> t(
  //     Map<dynamic, dynamic> arguments) {
  //   return StreamBuilder(
  //     stream: FirebaseFirestore.instance
  //         .collection('Trips')
  //         .doc(arguments['TripID'])
  //         .snapshots(),
  //     builder: (context, snapshot) {
  //       if (snapshot.hasError) {
  //         return Center(
  //           child: Text('Error: ${snapshot.error}'),
  //         );
  //       }

  //       if (!snapshot.hasData || !snapshot.data!.exists) {
  //         return Center(
  //           child: Text('Document does not exist'),
  //         );
  //       }
  //       List<dynamic> arrayValues = [
  //         snapshot.data!.get('pending'),
  //         snapshot.data!.get('accepted'),
  //         snapshot.data!.get('rejected')
  //       ];
  //       if (arrayValues[0].contains(SqfProfile.email)) {
  //         return buttonShow(arguments, 0);
  //       } else if (arrayValues[1].contains(SqfProfile.email)) {
  //         return buttonShow(arguments, 1);
  //       } else if (arrayValues[2].contains(SqfProfile.email)) {
  //         return buttonShow(arguments, 2);
  //       } else {
  //         return buttonShow(arguments, 0);
  //       }
  //     },
  //   );
  // }

  Widget buttonShow(Map<dynamic, dynamic> arguments, state) {
    if (state == 0 || state == 3) {
      return ElevatedButton(
          onPressed: () async {
            final t =
                await togglePending(arguments['TripID'], SqfProfile.email);
            final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
                .collection('userinfo')
                .where("email", isEqualTo: SqfProfile.email)
                .get();
            final DocumentReference db2 = querySnapshot.docs.first.reference;
            var db = FirebaseFirestore.instance;
            db.runTransaction((transaction) {
              return transaction.get(db2).then((sfDoc) {
                final newmoney = sfDoc.get("virtualmoney") - arguments['cost'];
                transaction.update(db2, {"virtualmoney": newmoney});
                return newmoney;
              });
            }).then((value) => print(value));
          },
          child: Text(state == 0 ? "Cancel" : "Book"));
    } else if (state == 1) {
      return Text("Accepted");
    } else {
      return Text("Can't Book Driver Rejected");
    }
  }
}
