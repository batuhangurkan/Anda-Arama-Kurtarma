import 'dart:io';

import 'package:bthn_test/Pages/alertpage.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa.dart';
import 'package:bthn_test/Pages/anasayfa/testsayfa.dart';
import 'package:bthn_test/Pages/yardimagi.dart';
import 'package:bthn_test/contants/contants.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/onboarding_screen.dart';
import 'package:bthn_test/service/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:bthn_test/Themes/ext.dart';
import 'package:bthn_test/Themes/themes.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with TickerProviderStateMixin {
  bool activeconnection = false;
  String _feedback = "loadingText".tr().toString();
  String _feedback2 = "Tekrar Dene";

  AuthService _authService = AuthService();

  Future checkuserconnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        setState(() {
          Future.delayed(Duration(seconds: 5), () {
            activeconnection = true;
            Navigator.of(context).pushNamedAndRemoveUntil(
                '/login-page', (Route<dynamic> route) => false);
          });
          _feedback = "loginNetConnectionSuccesText".tr().toString();
          _feedback2 = '';
        });
      }
    } on SocketException catch (_) {
      setState(() {
        activeconnection = false;
        _feedback =
            "İnternet bağlantısı başarısız!\nLütfen bağlantı ayarlarını kontrol ediniz.";
      });
    }
  }

  late final AnimationController _controller;
  @override
  void initState() {
    checkuserconnection();
    super.initState();
    Future.delayed(Duration(seconds: 10), () {});

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Tema tema = Tema();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: renk(arka_renk)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "assets/images/andaaramakurtarma.png",
                width: 200,
                height: 200,
              ),
              Column(
                children: [
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 200),
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Container(
                  child: Text(_feedback),
                ),
              ),
              Container(
                child: Text("languageCheckText".tr().toString()),
              ),
              if (activeconnection == false) ...[
                Container(
                  child: Column(
                    children: [
                      TextButton(
                          onPressed: () {
                            checkuserconnection();
                          },
                          child: Text(_feedback2)),
                    ],
                  ),
                )
              ],
            ],
          ),
        ),
      ),
    );
  }
}
