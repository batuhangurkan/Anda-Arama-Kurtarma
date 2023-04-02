import 'package:bthn_test/post_detail.dart';
import 'package:bthn_test/wp-api.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';

class WpHomePage extends StatefulWidget {
  const WpHomePage({Key? key}) : super(key: key);

  @override
  State<WpHomePage> createState() => _WpHomePageState();
}

class _WpHomePageState extends State<WpHomePage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
                        padding: const EdgeInsets.all(15.0),
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
                                wppost['title']['rendered'],
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                            ),
                            Text(parse(
                                    (wppost['excerpt']['rendered']).toString())
                                .documentElement!
                                .text),
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
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }
}
