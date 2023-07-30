import 'package:bthn_test/service/auth.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController _emailController = TextEditingController();
  AuthService _authService = AuthService();
  FirebaseAuth _auth = FirebaseAuth.instance;
  final User? user = FirebaseAuth.instance.currentUser;

//Şifremi unuttum fonksiyonu
  Future _resetPassword(String email) async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      Future.delayed(Duration(seconds: 1), () {});
      SnackBar snackBar = SnackBar(
        content: Text("Şifre sıfırlama maili gönderildi."),
        duration: Duration(seconds: 2),
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şifremi Unuttum"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Image.asset(
              "assets/images/andaaramakurtarma.png",
              width: 150,
              height: 150,
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                "Şifrenizi mi Unuttunuz?",
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
                          "Şifrenizi unuttuysanız aşağıdaki kutucuğa mail adresinizi yazarak şifrenizi sıfırlayabilirsiniz. ",
                      style: TextStyle(color: Colors.grey[500], fontSize: 13))),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(25.0),
                child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),
                      labelText: "E-mail Adresinizi Giriniz",
                      prefixIcon: Icon(Icons.mail),
                      labelStyle:
                          TextStyle(color: Colors.black.withOpacity(0.5)),
                    )),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                    onPressed: () {
                      _resetPassword(_emailController.text.trim());

                      if (_emailController.text == '') {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("E-mail adresi boş geçilemez!"),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ));
                      }
                    },
                    child: const Text(
                      "Şifremi Sıfırla",
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.red,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
