import 'package:bthn_test/lastearthquake.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/profile.dart';
import 'package:bthn_test/search.dart';
import 'package:flutter/material.dart';
import 'package:bthn_test/wp-api.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;

import '../../home_page.dart';
import '../../settings.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, this.wppost}) : super(key: key);

  final wppost;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentIndex = 0;
  final screens = [
    const WpHomePage(),
    const SearchPage(),
    LastEarthQuake(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        iconSize: 35,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place_outlined),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Home',
            backgroundColor: Colors.blue,
          ),
        ],
      ),
      appBar: AppBar(
        title: Text("Anasayfa"),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
                onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SettingsPage()),
                    ),
                child: Icon(Icons.settings)),
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}
