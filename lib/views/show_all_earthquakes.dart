import 'dart:async';

import 'package:bthn_test/Pages/lastearthquake.dart';
import 'package:bthn_test/models/deprem_model.dart';
import 'package:bthn_test/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';

class showAllEarthQuakes extends StatefulWidget {
  const showAllEarthQuakes({Key? key}) : super(key: key);

  @override
  State<showAllEarthQuakes> createState() => _showAllEarthQuakesState();
}

class _showAllEarthQuakesState extends State<showAllEarthQuakes> {
  @override
  void initState() {
    super.initState();

    //Google Maps Tıklandığında Marker Olayına Bak!!
  }

  @override
  Widget build(BuildContext context) {
    double? startLat = 15000;
    double? startLon = 15000;
    MapController _mapController = MapController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 148, 23, 14),
        title: Text("Detaylı Deprem Bilgisi"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
                child: Text(
              "Bir hata oluştu!",
            )),
          )
        ],
      ),
    );
  }
}
