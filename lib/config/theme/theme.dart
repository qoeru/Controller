import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

part 'app_colors.dart';

ThemeData DarkTheme() {
  return ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(),
    scaffoldBackgroundColor: AppColors.black,
  );
}
