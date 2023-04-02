import 'package:bthn_test/profile.dart';
import 'package:bthn_test/search.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'home_page.dart';
import 'lastearthquake.dart';

class PostDetailScreen extends StatefulWidget {
  const PostDetailScreen({super.key, this.wppost});

  final wppost;

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(parse((widget.wppost)['title']['rendered'].toString())
            .documentElement!
            .text),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: widget.wppost['id'],
                child: Image(
                  image: NetworkImage(
                    widget.wppost['_embedded']['wp:featuredmedia'][0]
                        ['source_url'],
                  ),
                )),
            Text(parse((widget.wppost['content']['rendered']).toString())
                .documentElement!
                .text)
          ],
        ),
      ),
    );
  }
}
