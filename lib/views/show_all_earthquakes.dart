import 'dart:async';

import 'package:bthn_test/lastearthquake.dart';
import 'package:bthn_test/models/deprem_model.dart';
import 'package:bthn_test/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class showAllEarthQuakes extends StatefulWidget {
  const showAllEarthQuakes({Key? key}) : super(key: key);

  @override
  State<showAllEarthQuakes> createState() => _showAllEarthQuakesState();
}

class _showAllEarthQuakesState extends State<showAllEarthQuakes> {
  List<Marker> markers = [];

  @override
  void initState() {
    super.initState();
    //Google Maps Tıklandığında Marker Olayına Bak!!
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GoogleMap(
            initialCameraPosition:
                CameraPosition(target: LatLng(100, 500), zoom: 1),
            mapType: MapType.hybrid,
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            markers: Set.of(markers)),
      ),
    );
  }
}
