import 'package:flutter/material.dart';

import 'package:blocpost/core/styles/theme_extensions/shimmer_theme_extension.dart';

class Shimmer extends StatefulWidget {
  const Shimmer({super.key, this.linearGradient, this.child});

  static ShimmerState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerState>();
  }

  final LinearGradient? linearGradient;
  final Widget? child;

  @override
  ShimmerState createState() => ShimmerState();
}

class ShimmerState extends State<Shimmer> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;

  Listenable get shimmerChanges => _shimmerController;

  @override
  void initState() {
    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
    super.initState();
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  Gradient get gradient {
    final gradient =
        widget.linearGradient ??
        Theme.of(context).extension<ShimmerThemeExtension>()?.shimmerGradient;

    if (gradient == null) {
      throw Error.throwWithStackTrace(
        'No shimmer gradient provided and none found in Theme',
        StackTrace.current,
      );
    }

    return LinearGradient(
      colors: gradient.colors,
      stops: gradient.stops,
      begin: gradient.begin,
      end: gradient.end,
      transform: _SlidingGradientTransform(
        slidePercent: _shimmerController.value,
      ),
    );
  }

  bool get isSized =>
      (context.findRenderObject() as RenderBox?)?.hasSize ?? false;

  Size get size => (context.findRenderObject() as RenderBox).size;

  Offset getDescendantOffset({
    required RenderBox descendant,
    Offset offset = Offset.zero,
  }) {
    final shimmerBox = context.findRenderObject() as RenderBox;
    return descendant.localToGlobal(offset, ancestor: shimmerBox);
  }

  @override
  Widget build(BuildContext context) {
    return widget.child ?? const SizedBox();
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({required this.slidePercent});

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
