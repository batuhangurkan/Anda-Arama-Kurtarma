import 'package:bthn_test/Pages/yardimagi.dart';
import 'package:bthn_test/login.dart';
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
                  "Kayıt Sayfası,",
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
                        text:
                            "Bu sayfa yönetici kayıt sayfasıdır. Üyelikler onaya tabii tutulacaktır.",
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
              Container(
                decoration: tema.inputBoxDec(),
                margin: EdgeInsets.only(bottom: 20, right: 10, left: 10),
                padding: EdgeInsets.only(left: 15, right: 15, bottom: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            labelText: "Şifre Onay",
                            prefixIcon: Icon(Icons.vpn_key_outlined),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
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
                    "Kayıt Ol",
                    style: GoogleFonts.quicksand(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
                ),
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
                            child: Text("Okudunum, Kabul Ediyorum.")),
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
                          text:
                              "Bu uygulama kişisel verilerinizi kaydeder. Detaylar için",
                          style:
                              TextStyle(color: Colors.grey[500], fontSize: 11),
                          children: [
                        TextSpan(
                            text: " KVKK Metnini Okuyun.",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 11,
                                fontWeight: FontWeight.bold))
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
                  width: MediaQuery.of(context).size.width / 1.0,
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
