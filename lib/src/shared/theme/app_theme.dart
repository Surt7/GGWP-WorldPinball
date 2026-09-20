import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs basées sur ton image
  static const _darkBackground = Color(0xFF121212); // Gris anthracite très sombre
  static const _primaryRed = Color(0xFFE53935);    // Rouge vif "Pinball"
  static const _surfaceGrey = Color(0xFF1E1E1E);   // Gris pour les cartes/tuiles

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: _darkBackground,
      
      colorScheme: const ColorScheme.dark(
        primary: _primaryRed,
        secondary: _primaryRed,
        surface: _surfaceGrey,
        background: _darkBackground,
      ),

      // Personnalisation de l'AppBar
      appBarTheme: const AppBarTheme(
        backgroundColor: _darkBackground,
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),

      // Style pour les listes
      listTileTheme: const ListTileThemeData(
        iconColor: _primaryRed,
        textColor: Colors.white,
      ),
    );
  }
}
