import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const primaryColor = Color(0xff13131e);
const secondaryColor = Color(0xFFF9F9F9);
const tertiaryColor = Color(0xff6150E8);
const fourthColor = Color(0xffA93BFD);
const fifthColor = Color(0xFF21202A);

var gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      primaryColor,
      tertiaryColor,
      fourthColor,
    ]);
var gradient1 = LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      tertiaryColor,
      tertiaryColor,
      fourthColor,
    ]);

var style1 = GoogleFonts.poppins(
  fontSize: 25.0,
  color: secondaryColor,
  fontWeight: FontWeight.bold,
  wordSpacing: 2,
);
var style2 = GoogleFonts.poppins(
  fontSize: 14.0,
  color: secondaryColor,
  wordSpacing: 1,
  letterSpacing: 0.5,
);
