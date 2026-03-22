import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color.dart';

const _primary = Color(0xFF235697);
const _onPrimary = Color(0xFFFFFFFF);
const _secondary = Color(0xFF0A69AD);
const _onSecondary = Color(0xFFFFFFFF);
const _error = Color(0xFFFF2149);
const _onError = Color(0xFFFFFFFF);
const _surfaceDim = Color(0xFFD0D0D0);
const _surface = Color(0xFFFFFFFF);
const _onSurface = Color(0xFF3A3C4C);
const _onSurfaceVariant = Color(0xFF7D7C93);
const _surfaceContainer = Color(0xFFFFFFFF);
const _outline = Color(0xFFD0D0D0);
const _badgeStar = Color(0xFFFF8000);
const _cardShadow = Color(0x0D000000);
const _success = Color(0xFFE8E8E8);
const _warning = Color(0xFFE8E8E8);
const _outlineVariant = Color(0xFFF3F3F3);
const _inverseSurface = Color(0xFF2E3036);
const _onInverseSurface = Color(0xFFFFFFFF);

final ThemeData lightTheme = ThemeData(
  fontFamily: 'Inter',
  useMaterial3: true,
  colorScheme: ColorScheme.light(
    primary: _primary,
    secondary: _secondary,
    onSecondary: _onSecondary,
    onPrimary: _onPrimary,
    onSurface: _onSurface,
    onSurfaceVariant: _onSurfaceVariant,
    surfaceDim: _surfaceDim,
    surface: _surface,
    surfaceContainer: _surfaceContainer,
    error: _error,
    onError: _onError,
    onErrorContainer: _onError,
    outline: _outline,
    outlineVariant: _outlineVariant,
    inverseSurface: _inverseSurface,
    onInverseSurface: _onInverseSurface,
  ),
  extensions: const <ThemeExtension<dynamic>>[
    CustomColors(
      badgeStar: _badgeStar,
      cardShadow: _cardShadow,
      success: _success,
      warning: _warning,
    ),
  ],
  textTheme: TextTheme(
    displayLarge: GoogleFonts.inter(
      fontSize: 30,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: _onSurface,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 26,
      fontWeight: FontWeight.w600,
      height: 1.2,
      color: _onSurface,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 22,
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: _onSurface,
    ),

    headlineLarge: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 1.25,
      color: _onSurface,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: _onSurface,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 1.3,
      color: _onSurface,
    ),

    titleLarge: GoogleFonts.inter(
      fontSize: 16,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: _onSurface,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 1.35,
      color: _onSurface,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.35,
      color: _onSurface,
    ),

    bodyLarge: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: _onSurface,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: _onSurface,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12,
      fontWeight: FontWeight.w400,
      height: 1.4,
      color: _onSurface,
    ),

    labelLarge: GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      height: 1.3,
      color: _onSurface,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 11,
      fontWeight: FontWeight.w400,
      height: 1.3,
      color: _onSurface,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 10,
      fontWeight: FontWeight.w400,
      height: 1.2,
      color: _onSurface,
    ),
  ),
);
