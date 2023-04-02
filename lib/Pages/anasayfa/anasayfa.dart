import 'package:bthn_test/Pages/anasayfa/testsayfa.dart';
import 'package:bthn_test/login.dart';
import 'package:bthn_test/main.dart';
import 'package:bthn_test/register.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';


void main() {
  runApp(const MyApp());
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  final urlImages = [
    'https://img.freepik.com/free-vector/flat-illustration-earthquake-turkey_23-2150159103.jpg?w=1380&t=st=1676573063~exp=1676573663~hmac=0ef1f1f0d6bda7e41d2012f275f5f7cb27c7c431bc0599fb36cedfecbf921c3b.png',
    'https://img.freepik.com/free-vector/flat-illustration-earthquake-turkey_23-2150159103.jpg?w=1380&t=st=1676573063~exp=1676573663~hmac=0ef1f1f0d6bda7e41d2012f275f5f7cb27c7c431bc0599fb36cedfecbf921c3b.png',
  ];

  get controller => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Ana Sayfa"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 20),
              child: CarouselSlider.builder(
                options: CarouselOptions(height: 200),
                itemCount: urlImages.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  final urlImage = urlImages[index];

                  return buildImage(urlImage, index);
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(16, 16, 16, 16),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Arama Yapın',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: const BorderSide(color: Colors.black)),
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  child: Text(
                    "Deprem Bilgilendirme",
                    style: GoogleFonts.openSans(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.menu_book,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "   Deprem Anında Yapılması Gerekenler",
                            style: GoogleFonts.openSans(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.menu_book,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "   Acil Durumlarda Çantamda Neler Olmalı?",
                            style: GoogleFonts.openSans(
                                color: Colors.black, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    margin: EdgeInsets.only(top: 15),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[350],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                offset: Offset(0, 2),
                                blurRadius: 5)
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.menu_book,
                            size: 50,
                            color: Colors.red,
                          ),
                          Text(
                            "  Türkiye'de Olan Son Depremler Hakkında Bilgi",
                            style: GoogleFonts.openSans(
                                color: Colors.black, fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 12),
        color: Colors.white,
        child: Image.network(
          urlImage,
          fit: BoxFit.cover,
        ),
      );
}

//Anasayfada Detaylı Arama Bölümü
  /*class MySearchDelegate extends SearchDelegate {
  /@override
  Widget? buildLeading(BuildContext context) => IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back),);

  @override
  List<Widget>? buildActions(BuildContext context) => [ IconButton(onPressed: () {
    if (query.isEmpty) {
      close(context, null);
    } else{
    query = "";
  } }, icon: Icon(Icons.clear),
  ), ];

  @override
  Widget buildResults(BuildContext context) => Center(
    child: Text(
      query,
      style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestions = [
      'Son Depremler',
      'Deprem Çantası Nasıl Hazırlanır?',
      'Turkey',

    ];

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final suggestion = suggestions[index];

        return ListTile(
          title: Text(suggestion),
          onTap: () {
            query = suggestion;

            showResults(context);
          },
        );
      },
    );
  }
}

  */

