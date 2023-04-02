import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final double coverHeight = 280;
  final double profileHeight = 144;

  @override
  Widget build(BuildContext context) {

    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          buildCoverImage(),
          Positioned(top: top,child:buildProfileImage(),
          ),
        ],
      ),
    );
  }


Widget buildCoverImage() => Container(
color: Colors.grey,
child: Image.network("https://images.unsplash.com/photo-1549793959-284bccc3331b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
    width: double.infinity,
    height: coverHeight,
    fit: BoxFit.cover
),

);

Widget buildProfileImage() => CircleAvatar(
  radius: profileHeight / 2,
  backgroundColor: Colors.grey.shade800,
  backgroundImage: NetworkImage("https://i.hizliresim.com/t3rd61p.jpeg"
  ),
);

Widget buildContent() => Column(
  children: [
    Text("Batuhan GÜrkan"),
    const SizedBox(height: 8,),
    Text("Developer")
  ],
);

}