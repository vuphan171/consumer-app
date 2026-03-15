import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'custom_color.dart';

const _primary = Color(0xFF006FFD);
const _onPrimary = Color(0xFFFFFFFF);
const _secondary = Color(0xFF0A69AD);
const _onSecondary = Color(0xFFFFFFFF);
const _error = Color(0xFFFF2149);
const _onError = Color(0xFFFFFFFF);
const _surfaceDim = Color(0xFFD0D0D0);
const _surface = Color(0xFFFFFFFF);
const _onSurface = Color(0xFF2A2C36);
const _onSurfaceVariant = Color(0xFF7D7C93);
const _surfaceContainer = Color(0xFFFFFFFF);
const _outline = Color(0xFFD0D0D0);
const _badgeStar = Color(0xFFFF8000);
const _cardShadow = Color(0x0D000000);
const _success = Color(0xFFE8E8E8);
const _warning = Color(0xFFE8E8E8);

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
      fontSize: 28.sp,
      fontWeight: FontWeight.w600,
      color: _onSurface,
    ),
    displayMedium: GoogleFonts.inter(
      fontSize: 24.sp,
      fontWeight: FontWeight.w600,
      color: _onSurface,
    ),
    displaySmall: GoogleFonts.inter(
      fontSize: 22.sp,
      fontWeight: FontWeight.w600,
      color: _onSurface,
    ),
    headlineMedium: GoogleFonts.inter(
      fontSize: 20.sp,
      fontWeight: FontWeight.w600,
      color: _onSurface,
    ),
    headlineSmall: GoogleFonts.inter(
      fontSize: 18.sp,
      fontWeight: FontWeight.w600,
      color: _onSurface,
    ),
    titleLarge: GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: _onSurface,
    ),
    titleMedium: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: _onSurface,
    ),
    titleSmall: GoogleFonts.inter(
      fontSize: 13.sp,
      fontWeight: FontWeight.w500,
      color: _onSurface,
    ),
    bodyLarge: GoogleFonts.inter(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
      color: _onSurface,
    ),
    bodyMedium: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
      color: _onSurface,
    ),
    bodySmall: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.normal,
      color: _onSurface,
    ),
    labelLarge: GoogleFonts.inter(
      fontSize: 14.sp,
      fontWeight: FontWeight.w500,
      color: _onSurface,
    ),
    labelMedium: GoogleFonts.inter(
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: _onSurface,
    ),
    labelSmall: GoogleFonts.inter(
      fontSize: 10.sp,
      fontWeight: FontWeight.w500,
      color: _onSurface,
    ),
  ),
);
