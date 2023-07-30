import 'package:bthn_test/Pages/yardimagi.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/service/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:bthn_test/Themes/ext.dart';
import 'package:bthn_test/Themes/themes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Tema tema = Tema();
  TextEditingController _registerMailController = TextEditingController();
  TextEditingController _registerPasswordController = TextEditingController();
  TextEditingController _registerPasswordValidController =
      TextEditingController();
  final username = '';
  final password = '';
  final passwordValid = '';
  bool visibilityPassword = false;

  AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 148, 23, 14),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_outlined),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(color: Colors.white),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
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
                  "registerPageText".tr().toString(),
                  style: GoogleFonts.righteous(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 5),
                child: RichText(
                    text: TextSpan(
                        text: "registerPageDescText".tr().toString(),
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 13))),
              ),
              Container(
                decoration: tema.inputBoxDec(),
                margin:
                    EdgeInsets.only(top: 25, bottom: 10, right: 10, left: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                child: TextFormField(
                  controller: _registerMailController,
                  decoration: InputDecoration(
                      labelText: "emailText".tr().toString(),
                      prefixIcon: Icon(Icons.mail_lock_outlined),
                      fillColor: Colors.grey,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25),
                        borderSide: new BorderSide(),
                      )),
                  style: GoogleFonts.openSans(
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
                        controller: _registerPasswordController,
                        obscureText: visibilityPassword,
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
                        style: GoogleFonts.openSans(
                          color: renk(metin_renk),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: tema.inputBoxDec(),
                margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _registerPasswordValidController,
                        obscureText: visibilityPassword,
                        decoration: InputDecoration(
                            labelText:
                                "passWordTextVerification".tr().toString(),
                            prefixIcon: Icon(Icons.vpn_key_outlined),
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
                        style: GoogleFonts.openSans(
                          color: renk(metin_renk),
                        ),
                      ),
                    ),
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
                              .createPerson(_registerMailController.text,
                                  _registerPasswordController.text)
                              .then((value) {
                            var snackBar = SnackBar(
                              content: Text("loginSuccesText".tr().toString()),
                              duration: Duration(seconds: 2, milliseconds: 500),
                              backgroundColor: Colors.green,
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                            Future.delayed(Duration(seconds: 2), () {});
                            return Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          });
                        });
                        if (_registerMailController.text == '') {
                          var snackBar = SnackBar(
                            content: Text(
                                "Email Alanı boş geçilemez".tr().toString()),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (_registerPasswordController.text == '') {
                          var snackBar = SnackBar(
                            content: Text(
                                "Şifre Alanı boş geçilemez".tr().toString()),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                        } else if (_registerPasswordValidController.text ==
                            '') {
                          var snackBar = SnackBar(
                            content: Text("Şifre Onay Alanı boş geçilemez"
                                .tr()
                                .toString()),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                        } else if (_registerMailController.text !=
                            _registerPasswordValidController) {
                          var snack = SnackBar(
                            content: Text("Şifreler Uyuşmuyor"),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                        } else if (_registerPasswordController.text.length <
                            6) {
                          var snack = SnackBar(
                            content: Text("Şifre 6 karakterden az olamaz"),
                            duration: Duration(seconds: 2, milliseconds: 500),
                            backgroundColor: Colors.red,
                          );
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(
                          horizontal: 100.0, vertical: 15.0),
                      primary: Colors.red,
                      shape: StadiumBorder(),
                    ),
                    child: Text("registerButtonText".tr().toString())),
              ),
              InkWell(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text("Kullanım Koşulları"),
                      content: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Okudum, Kabul Ediyorum.")),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                Text("Content Değişti");
                              });
                            },
                            child: Column(
                              children: [
                                TextButton(
                                    onPressed: () => Navigator.pop(context),
                                    child: Text("İptal"))
                              ],
                            )),
                      ],
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(top: 40),
                  child: RichText(
                      text: TextSpan(
                          text: "kvkkText".tr().toString(),
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 11),
                          children: [
                        TextSpan(
                            text: "readKvvkText".tr().toString(),
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ))
                      ])),
                ),
              ),
              InkWell(
                onTap: () {
                  showCupertinoDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: const Text("KVKK Onay Metni"),
                      content: const Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                      actions: <Widget>[
                        TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Okudum, Kabul Ediyorum.")),
                        TextButton(
                          onPressed: () {
                            setState(() {
                              Text("Content Değişti");
                            });
                          },
                          child: Column(
                            children: [
                              TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("İptal")),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  margin: EdgeInsets.only(top: 30),
                  child: RichText(
                      text: TextSpan(
                          text: "Kullanım koşullarına bakmak için",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 11),
                          children: [
                        TextSpan(
                            text: " Tıklayın",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 11,
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
