import 'package:bthn_test/Pages/alertpage.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa2.dart';
import 'package:bthn_test/contactus.dart';
import 'package:bthn_test/contants/contants.dart';
import 'package:bthn_test/editprofile.dart';
import 'package:bthn_test/home_page.dart';
import 'package:bthn_test/home_page_guest.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/onboarding_screen.dart';
import 'package:bthn_test/profile.dart';
import 'package:bthn_test/service/auth.dart';
import 'package:bthn_test/settings.dart';
import 'package:bthn_test/views/show_all_earthquakes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/loading.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:permission_handler/permission_handler.dart';

int? initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Permission.notification.isDenied.then((value) {
    if (value) {
      Permission.notification.request();
    }
  });

  OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
  OneSignal.shared.setAppId("c96c7f56-29ae-4b97-85cf-ea94ad156612");
  OneSignal.shared
      .promptLocationPermission()
      .then((accepted) => print("Permission accepted"));
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen', 1);
  runApp(EasyLocalization(
      child: MyApp(),
      supportedLocales: [LocaleConstants.enLocale, LocaleConstants.trLocale],
      saveLocale: true,
      fallbackLocale: LocaleConstants.enLocale,
      path: LocaleConstants.localePath));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      title: 'Anda - Arama Kurtmarma',
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      initialRoute:
          initScreen == 0 || initScreen == null ? 'onboard' : 'loading',
      routes: {
        'loading': (context) => LoadingPage(),
        '/login-page': (context) => LoginPage(),
        'onboard': (context) => OnBoardingScreen(),
        '/home-page': (context) => MyHomePage(),
        '/show-all-earthquakes': (context) => showAllEarthQuakes(),
        '/contact-us': (context) => ContactUsPage(),
        '/settings-page': (context) => SettingsPage(),
        '/alert-page': (context) => AlertPage(),
        '/edit-profile-page': (context) => EditProfilPage(),
        '/home-page-guest': (context) => MyHomePageGuest(),
        '/profile-page': (context) => ProfilePage(),
      },
    );
  }
}
