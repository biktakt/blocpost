import 'package:flutter/material.dart';

import 'package:blocpost/core/styles/theme_extensions/shimmer_theme_extension.dart';

class AppThemeScheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const ShimmerThemeExtension(shimmerGradient: _lightShimmerGradient),
    ],
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    extensions: <ThemeExtension<dynamic>>[
      const ShimmerThemeExtension(shimmerGradient: _darkShimmerGradient),
    ],
  );
}

const _lightShimmerGradient = LinearGradient(
  colors: [Color(0xFFEBEBF4), Color(0xFFF4F4F4), Color(0xFFEBEBF4)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
);

const _darkShimmerGradient = LinearGradient(
  colors: [Color(0xFF2A2A2E), Color(0xFF3A3A3F), Color(0xFF2A2A2E)],
  stops: [0.1, 0.3, 0.4],
  begin: Alignment(-1.0, -0.3),
  end: Alignment(1.0, 0.3),
);
