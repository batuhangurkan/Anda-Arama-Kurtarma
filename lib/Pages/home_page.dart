import 'package:bthn_test/Pages/post_detail.dart';
import 'package:bthn_test/Pages/wp-api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:html/parser.dart';

class WpHomePage extends StatefulWidget {
  const WpHomePage({Key? key}) : super(key: key);

  @override
  State<WpHomePage> createState() => _WpHomePageState();
}

class _WpHomePageState extends State<WpHomePage> {
  Future refresh() {
    setState(() {
      fetchWpPosts();
    });
    return Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: refresh,
      child: FutureBuilder(
        future: fetchWpPosts(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                Map wppost = snapshot.data?[index];
                var imageurl =
                    wppost["_embedded"]["wp:featuredmedia"][0]["source_url"];
                return Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 0, right: 0, top: 5, bottom: 5),
                                child: Image.network(imageurl),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PostDetailScreen(
                                              wppost: wppost,
                                            )));
                              },
                              child: Text(
                                parse((wppost['title']['rendered']).toString())
                                    .documentElement!
                                    .text,
                                style: GoogleFonts.poppins(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              width: double.infinity,
                              child: Text(
                                parse((wppost['excerpt']['rendered'])
                                        .toString())
                                    .documentElement!
                                    .text,
                                style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Text(parse((wppost['date']).toString())
                                .documentElement!
                                .text),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            );
          }
          if (snapshot.hasError) {
            return Text('HATA : ${snapshot.hasError}');
          }
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(
                  color: Color.fromARGB(255, 148, 23, 14),
                ),
                Padding(padding: EdgeInsets.only(top: 10)),
                Text(
                  "Veriler Yükleniyor...",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
