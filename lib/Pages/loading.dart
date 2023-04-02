import 'package:bthn_test/Pages/alertpage.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa.dart';
import 'package:bthn_test/Pages/anasayfa/testsayfa.dart';
import 'package:bthn_test/Pages/yardimagi.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/onboarding_screen.dart';
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
  late final AnimationController _controller;
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => OnBoardingScreen()));
    });

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
              Image.network(
                  "https://cdn.discordapp.com/attachments/733749607535870034/1076213367926177852/2.png"),
              Column(
                children: [
                  Center(
                    child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: CircularProgressIndicator(
                          color: Colors.redAccent,
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
