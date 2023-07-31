import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bthn_test/Themes/ext.dart';
import 'package:bthn_test/Pages/login.dart';

class Tema {
  inputDec(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: GoogleFonts.openSans(
        color: renk(metin_renk),
      ),
      border: InputBorder.none,
      prefixIcon: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }

  inputBoxDec() {
    return BoxDecoration(
      color: renk("ffffff"),
      borderRadius: BorderRadius.circular(40),
    );
  }
}
