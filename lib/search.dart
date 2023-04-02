import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);


  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Column(
      children: [
        Center(child: Text("Search", style: GoogleFonts.openSans(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),)),
      ],
    ),
    );
  }
}
