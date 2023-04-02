import 'package:bthn_test/Pages/yardimagi.dart';
import 'package:bthn_test/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bthn_test/Themes/ext.dart';
import 'package:bthn_test/Themes/themes.dart';

void main() {
  runApp(MyApp());
}

class AlertPage extends StatefulWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  State<AlertPage> createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Tema tema = Tema();
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: AppBar(
            flexibleSpace: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 55,
                  ),
                  Container(
                      child: Icon(
                    FontAwesomeIcons.triangleExclamation,
                    size: 35,
                    color: Colors.white,
                  )),
                  Container(
                      child: Text(
                    "Deprem Uyarı Sistemi",
                    style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )),
                  Container(
                    child: Text(
                      "Tahmini büyüklük: 6.1",
                      style: GoogleFonts.openSans(
                          fontSize: 17, color: Colors.white),
                    ),
                  ),
                  Container(
                    child: Text(
                      "16 KM uzakta",
                      style: GoogleFonts.openSans(
                          fontSize: 17, color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
            backgroundColor: Colors.red,
          )),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Text(
                  "Çömel",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Image.network(
                    "https://cdn.discordapp.com/attachments/733749607535870034/1074396497577267290/comel.png",
                    width: 300),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Text(
                  "Kapan",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.network(
                    "https://cdn.discordapp.com/attachments/733749607535870034/1074396497849888798/kapan.png",
                    width: 300),
              ),
              Container(
                margin: EdgeInsets.only(top: 1),
                child: Text(
                  "Tutun",
                  style: GoogleFonts.openSans(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 30),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Image.network(
                    "https://cdn.discordapp.com/attachments/733749607535870034/1074397066522001499/ttutunn.png",
                    width: 300),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  "Deprem Bildirim Sistemi",
                  style:
                      GoogleFonts.openSans(color: Colors.white, fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AlertPage()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.black, Colors.black]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 4),
                            blurRadius: 5)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.volumeMute,
                          size: 20,
                          color: Colors.red,
                        ),
                        Center(
                            child: Text(
                          " Bildirimi Sessize Al",
                          style: GoogleFonts.openSans(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomeScreen()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  height: 25,
                  decoration: BoxDecoration(
                      gradient:
                          LinearGradient(colors: [Colors.black, Colors.black]),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            offset: Offset(0, 4),
                            blurRadius: 5)
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          FontAwesomeIcons.phone,
                          size: 20,
                          color: Colors.red,
                        ),
                        Center(
                            child: Text(
                          "  Yardım Ağı Sayfası",
                          style: GoogleFonts.openSans(
                              color: Colors.red,
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        )),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
