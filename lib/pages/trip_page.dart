// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TripCardPage extends StatefulWidget {
  const TripCardPage({super.key});

  @override
  State<TripCardPage> createState() => _TripCardPageState();
}

class _TripCardPageState extends State<TripCardPage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: Text('Omar')),
      body: Center(
        child: SingleChildScrollView(
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
              Card(
                child: Column(children: [
                  Text('Driver name'),
                  Text('Driver Car'),
                  Text('Date of the drive'),
                  Text('Time of the drive'),
                  Text('To location from location')
                ]),
              ),
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: ElevatedButton(onPressed: () {}, child: Text('Book')),
              )
            ],
          ),
        ),
      ),
    );
  }
}