import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color primaryBlue = Color(0xFF1A237E);
  static const Color accentBlue = Color(0xFF1565C0);
  static const Color lightBlue = Color(0xFF1976D2);
  static const Color warningAmber = Color(0xFFFFC107);
  static const Color dangerRed = Color(0xFFD32F2F);
  static const Color successGreen = Color(0xFF388E3C);
  static const Color surfaceWhite = Color(0xFFFFFFFF);
  static const Color backgroundGrey = Color(0xFFF5F5F5);
  static const Color borderGrey = Color(0xFFE0E0E0);
  static const Color textPrimary = Color(0xFF1A1A1A);
  static const Color textSecondary = Color(0xFF757575);
  static const Color textTertiary = Color(0xFFBDBDBD);

  static ThemeData get theme => ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(
          primary: primaryBlue,
          secondary: accentBlue,
          surface: surfaceWhite,
          background: backgroundGrey,
        ),
        textTheme: GoogleFonts.dmSansTextTheme().copyWith(
          displayLarge: GoogleFonts.dmSans(
            fontSize: 56,
            fontWeight: FontWeight.w800,
            letterSpacing: -2,
            color: textPrimary,
          ),
          displayMedium: GoogleFonts.dmSans(
            fontSize: 40,
            fontWeight: FontWeight.w800,
            letterSpacing: -1.5,
            color: textPrimary,
          ),
          headlineLarge: GoogleFonts.dmSans(
            fontSize: 28,
            fontWeight: FontWeight.w700,
            letterSpacing: -0.5,
            color: textPrimary,
          ),
          headlineMedium: GoogleFonts.dmSans(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            letterSpacing: 0,
            color: textPrimary,
          ),
          titleLarge: GoogleFonts.dmSans(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
            color: textPrimary,
          ),
          titleMedium: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            color: textSecondary,
          ),
          bodyLarge: GoogleFonts.dmSans(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: textSecondary,
          ),
          bodyMedium: GoogleFonts.dmSans(
            fontSize: 13,
            fontWeight: FontWeight.w400,
            color: textSecondary,
          ),
          labelLarge: GoogleFonts.dmSans(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: textPrimary,
          ),
        ),
        scaffoldBackgroundColor: surfaceWhite,
        appBarTheme: AppBarTheme(
          backgroundColor: surfaceWhite,
          elevation: 0,
          scrolledUnderElevation: 0,
          titleTextStyle: GoogleFonts.dmSans(
            fontSize: 14,
            fontWeight: FontWeight.w800,
            letterSpacing: 2.0,
            color: textPrimary,
          ),
          iconTheme: const IconThemeData(color: textPrimary),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: surfaceWhite,
          selectedItemColor: primaryBlue,
          unselectedItemColor: textSecondary,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
        ),
      );
}
