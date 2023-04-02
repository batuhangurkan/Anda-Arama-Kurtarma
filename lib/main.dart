import 'package:bthn_test/Pages/alertpage.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa2.dart';
import 'package:bthn_test/home_page.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/onboarding_screen.dart';
import 'package:bthn_test/views/show_all_earthquakes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/loading.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboard' : '/login-page',
      routes: {
        '/login-page': (context) => LoginPage(),
        'onboard': (context) => OnBoardingScreen(),
        '/home-page': (context) => MyHomePage(),
        '/show-all-earthquakes': (context) => showAllEarthQuakes(),
      },
    );
  }
}
