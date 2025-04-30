import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

abstract class ThemeModeController {
  ThemeMode get themeMode;
  void switchTheme(ThemeMode themeMode);
}

@immutable
class AppThemeMode extends StatefulWidget {
  const AppThemeMode({
    required this.child,
    this.themeMode = ThemeMode.system,
    super.key,
  });

  final Widget child;
  final ThemeMode themeMode;

  static ThemeModeController? of(BuildContext context) =>
      _AppThemeModeScope.of(context)?.state;

  @override
  State<AppThemeMode> createState() => _AppThemeModeState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(StringProperty('description', 'AppThemeMode StatefulWidget')),
      );
}

class _AppThemeModeState extends State<AppThemeMode>
    implements ThemeModeController {
  ThemeMode _themeMode = ThemeMode.system;

  @override
  ThemeMode get themeMode => _themeMode;

  @override
  void switchTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  void initState() {
    super.initState();
    _themeMode = widget.themeMode;
  }

  @override
  void didUpdateWidget(AppThemeMode oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties..add(
          StringProperty(
            'description',
            '_AppThemeModeState State<AppThemeMode>',
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => _AppThemeModeScope(
    state: this,
    themeMode: _themeMode,
    child: widget.child,
  );
}

@immutable
class _AppThemeModeScope extends InheritedWidget {
  const _AppThemeModeScope({
    required super.child,
    required this.state,
    required this.themeMode,
  });

  final _AppThemeModeState state;
  final ThemeMode themeMode;

  /// Find _AppThemeModeScope in BuildContext
  static _AppThemeModeScope? of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<_AppThemeModeScope>();

  @override
  bool updateShouldNotify(_AppThemeModeScope oldWidget) {
    return themeMode != oldWidget.themeMode;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) =>
      super.debugFillProperties(
        properties
          ..add(StringProperty('description', 'Scope of AppThemeMode'))
          ..add(
            ObjectFlagProperty<_AppThemeModeState>(
              '_AppThemeModeState',
              state,
              ifNull: 'none',
            ),
          )
          ..defaultDiagnosticsTreeStyle = DiagnosticsTreeStyle.offstage,
      );
}
