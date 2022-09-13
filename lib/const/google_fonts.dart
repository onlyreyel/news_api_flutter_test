import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

myStyle(double? fonsize, Color? clr, [FontWeight? fontWeight]) {
  return GoogleFonts.roboto(
    fontSize: fonsize,
    fontWeight: fontWeight,
    color: clr,
  );
}
