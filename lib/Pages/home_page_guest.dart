import 'package:bthn_test/Pages/lastearthquake.dart';
import 'package:bthn_test/Pages/login.dart';
import 'package:bthn_test/Pages/profile.dart';
import 'package:bthn_test/Pages/search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:bthn_test/Pages/wp-api.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import 'home_page.dart';
import 'settings.dart';

class MyHomePageGuest extends StatefulWidget {
  const MyHomePageGuest({Key? key}) : super(key: key);

  @override
  State<MyHomePageGuest> createState() => _MyHomePageGuestState();
}

class _MyHomePageGuestState extends State<MyHomePageGuest> {
  int currentIndex = 0;
  final screens = [
    const WpHomePage(),
    LastEarthQuake(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Color.fromARGB(255, 148, 23, 14),
        unselectedItemColor: Colors.white,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        iconSize: 35,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'bottomNavigationBarTextHome'.tr().toString(),
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'lastEarthQuakeNavigationBarText'.tr().toString(),
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/login-page', (route) => false);
              },
              icon: Icon(Icons.exit_to_app))
        ],
        title: Text('appBarText'.tr().toString()),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 148, 23, 14),
      ),
      body: screens[currentIndex],
    );
  }
}
