import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const Color background = Color(0xFFF6F8FA);
  static const Color primary = Colors.pinkAccent;
  static const Color primaryLight = Color(0xFF5E93FF);

  static const Color card = Colors.white;
  static const Color textDark = Color(0xFF1E2022);
  static const Color textMuted = Color(0xFF77838F);

  static const Color success = Color(0xFF16834A);
  static const Color successBackground = Color(0xFFE2F8ED);

  static const Color danger = Color(0xFFD64545);
  static const Color dangerBackground = Color(0xFFFFE8E8);

  static const LinearGradient headerGradient = LinearGradient(
    colors: [primary, primaryLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
