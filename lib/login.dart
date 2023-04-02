import 'package:bthn_test/Pages/anasayfa/anasayfa.dart';
import 'package:bthn_test/Pages/anasayfa/anasayfa2.dart';
import 'package:bthn_test/register.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:bthn_test/Themes/ext.dart';
import 'package:bthn_test/Themes/themes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Tema tema = Tema();
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
                    child: Image.network(
                        "https://cdn.discordapp.com/attachments/733749607535870034/1076213367926177852/2.png"),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  "Merhaba,",
                  style: GoogleFonts.righteous(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              Container(
                child: RichText(
                    text: TextSpan(
                        text:
                            "Bu sayfa yönetici giriş sayfasıdır. Yönetici olanlar giriş yapabilir.Yönetici değilseniz misafir olarak devam edebilirsiniz.",
                        style:
                            TextStyle(color: Colors.grey[500], fontSize: 13))),
              ),
              Container(
                decoration: tema.inputBoxDec(),
                margin:
                    EdgeInsets.only(top: 30, bottom: 10, right: 10, left: 10),
                padding:
                    EdgeInsets.only(left: 15, right: 15, top: 5, bottom: 5),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: "E-posta",
                      prefixIcon: Icon(Icons.local_post_office_outlined),
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
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Şifre",
                            prefixIcon: Icon(Icons.key),
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
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamedAndRemoveUntil(
                      '/home-page', (Route<dynamic> route) => false);
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.red]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Giriş Yap",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyHomePage()));
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: 50,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [Colors.red, Colors.red]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                      child: Text(
                    "Misafir Olarak Devam Et",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
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
                          text: "Hesabınız yok mu?",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 15),
                          children: [
                        TextSpan(
                            text: " Kayıt olun!",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 15,
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
