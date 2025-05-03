import 'package:flutter/material.dart';

@immutable
class ShimmerThemeExtension extends ThemeExtension<ShimmerThemeExtension> {
  const ShimmerThemeExtension({required this.shimmerGradient});

  final LinearGradient shimmerGradient;

  @override
  ShimmerThemeExtension copyWith({LinearGradient? shimmerGradient}) {
    return ShimmerThemeExtension(
      shimmerGradient: shimmerGradient ?? this.shimmerGradient,
    );
  }

  @override
  ShimmerThemeExtension lerp(
    ThemeExtension<ShimmerThemeExtension>? other,
    double t,
  ) {
    if (other is! ShimmerThemeExtension) return this;
    return ShimmerThemeExtension(
      shimmerGradient:
          LinearGradient.lerp(shimmerGradient, other.shimmerGradient, t)!,
    );
  }
}
