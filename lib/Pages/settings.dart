import 'contactus.dart';
import 'package:bthn_test/Pages/login.dart';
import 'package:bthn_test/service/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:contactus/contactus.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool themeChange = false;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
        appBar: AppBar(
          title: Text("settingsText".tr().toString()),
          backgroundColor: Color.fromARGB(255, 148, 23, 14),
        ),
        body: ListView(
          padding: EdgeInsets.all(10),
          children: [
            ListTile(
                title: Text("contactusText".tr().toString()),
                leading: Icon(Icons.call),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ContactUsPage()),
                  );
                }),
          ],
        ));
  }
}

void _changeTheme() {}

void _logOut(BuildContext context) {
  AuthService _authService = AuthService();
  _authService.signOut();
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
}
