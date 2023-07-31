import 'package:bthn_test/Pages/alertpage.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa2.dart';
import 'package:bthn_test/constants/contants.dart';
import 'package:bthn_test/Pages/onboarding_screen.dart';
import 'package:bthn_test/Pages/register.dart';
import 'package:bthn_test/Pages/resetpassword.dart';
import 'package:bthn_test/service/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:bthn_test/Themes/ext.dart';
import 'package:bthn_test/Themes/themes.dart';
import 'package:bthn_test/constants/contants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Tema tema = Tema();
  TextEditingController _usernamecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  bool visibilityPassword = false;
  bool isSucess = false;
  bool isLogin = false;
  var auth = FirebaseAuth.instance;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 70),
                width: 180,
                height: 180,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(
                          color: Colors.white.withOpacity(0.6), width: 10)),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Image.asset("assets/images/andaaramakurtarma.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "loginText".tr().toString(),
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                child: RichText(
                    text: TextSpan(
                        text: "loginDescText".tr().toString() ?? 'Hata',
                        style: GoogleFonts.poppins(
                            color: Colors.grey[500], fontSize: 12))),
              ),
              Container(
                decoration: tema.inputBoxDec(),
                margin:
                    EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                child: TextFormField(
                  controller: _usernamecontroller,
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      prefixIcon: Icon(Icons.local_post_office_outlined),
                      fillColor: Colors.grey,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25),
                        borderSide: new BorderSide(),
                      )),
                  style: GoogleFonts.poppins(
                    color: renk(metin_renk),
                  ),
                ),
              ),
              Container(
                decoration: tema.inputBoxDec(),
                margin:
                    EdgeInsets.only(top: 5, bottom: 30, right: 10, left: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        obscureText: visibilityPassword,
                        controller: _passwordcontroller,
                        decoration: InputDecoration(
                            labelText: "passWordText".tr().toString(),
                            prefixIcon: Icon(Icons.key),
                            suffixIcon: IconButton(
                              icon: Icon(visibilityPassword
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                              onPressed: () {
                                setState(() {
                                  visibilityPassword = !visibilityPassword;
                                });
                              },
                            ),
                            fillColor: Colors.grey,
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(25),
                              borderSide: new BorderSide(),
                            )),
                        style: GoogleFonts.poppins(
                          color: renk(metin_renk),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.5,
                child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        Future.delayed(Duration(seconds: 2), () {
                          _authService
                              .signIn(_usernamecontroller.text,
                                  _passwordcontroller.text)
                              .then((value) {
                            var snackBar = SnackBar(
                              content: Text("loginSuccesText".tr().toString()),
                              duration: Duration(seconds: 2, milliseconds: 500),
                              backgroundColor: Colors.green,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Future.delayed(Duration(seconds: 2), () {});
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                '/home-page', (Route<dynamic> route) => false);
                          });
                        });
                        if (_usernamecontroller.text == '' &&
                            _passwordcontroller.text == '') {
                          var snackBar = SnackBar(
                            content: Text(
                                "loginEmptyUserNamePassword".tr().toString()),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Future.delayed(Duration(seconds: 2), () {});
                        } else if (_usernamecontroller.text == '') {
                          var snackBar = SnackBar(
                            content: Text("loginEmptyUserName".tr().toString()),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Future.delayed(Duration(seconds: 2), () {});
                        } else if (_passwordcontroller.text == '') {
                          var snackBar = SnackBar(
                            content: Text("passwordEmpty".tr().toString()),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          Future.delayed(Duration(seconds: 2), () {});
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15.0),
                      primary: Color.fromARGB(255, 148, 23, 14),
                      shape: StadiumBorder(),
                    ),
                    child: Text("loginButtonText".tr().toString())),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            '/home-page-guest',
                            (Route<dynamic> route) => false);
                        var snackBar = SnackBar(
                          content: Text("loginSuccesGuestText".tr().toString()),
                          duration: Duration(seconds: 2, milliseconds: 500),
                          backgroundColor: Colors.green,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        Future.delayed(Duration(seconds: 2), () {});
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                            horizontal: 70.0, vertical: 15.0),
                        primary: Color.fromARGB(255, 148, 23, 14),
                        shape: StadiumBorder(),
                      ),
                      child: Text("loginGuestButtonText".tr().toString())),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 60),
                  child: RichText(
                      text: TextSpan(
                          text: "dontHaveAccountText".tr().toString(),
                          style: GoogleFonts.poppins(
                              color: Colors.grey[500], fontSize: 12),
                          children: [
                        TextSpan(
                            text: "registerNowText".tr().toString(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ])),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResetPasswordPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 25),
                  child: RichText(
                      text: TextSpan(
                          text: "Şifrenizi mi unuttunuz? ",
                          style: GoogleFonts.poppins(
                              color: Colors.grey[500], fontSize: 12),
                          children: [
                        TextSpan(
                            text: "Şifremi sıfırla",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 12,
                                fontWeight: FontWeight.bold))
                      ])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
