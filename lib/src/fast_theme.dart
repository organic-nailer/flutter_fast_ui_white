import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef MaterialBuilder = Widget Function(
    BuildContext context, ThemeData theme, ThemeData darkTheme, ThemeMode mode);

class FastThemeData {
  final MaterialColor accentColor;
  final bool isDark;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  late final Color nonColoredAccent;
  final Function(MaterialColor color) changeAccent;
  final Function(Brightness brightness) changeTheme;
  FastThemeData(
      this.accentColor,
      this.isDark,
      this.theme,
      this.darkTheme,
      this.themeMode,
      this.nonColoredAccent,
      this.changeAccent,
      this.changeTheme);

  FastThemeData.from(FastTheme fastTheme, Brightness platformBrightness)
      : accentColor = fastTheme.accentColor,
        isDark = fastTheme.themeMode == ThemeMode.dark ||
            (fastTheme.themeMode == ThemeMode.system &&
                platformBrightness == Brightness.dark),
        theme = fastTheme.theme,
        darkTheme = fastTheme.darkTheme,
        themeMode = fastTheme.themeMode,
        changeAccent = fastTheme.changeAccent,
        changeTheme = fastTheme.changeTheme {
    nonColoredAccent = isDark ? Colors.white : Colors.black;
  }
}

class FastTheme extends InheritedWidget {
  final Widget child;
  final MaterialColor accentColor;
  final ThemeData theme;
  final ThemeData darkTheme;
  final ThemeMode themeMode;
  final Function(MaterialColor color) changeAccent;
  final Function(Brightness brightness) changeTheme;
  const FastTheme(
      {Key? key,
      required this.child,
      required this.accentColor,
      required this.theme,
      required this.darkTheme,
      required this.themeMode,
      required this.changeAccent,
      required this.changeTheme})
      : super(key: key, child: child);

  static FastThemeData of(BuildContext context) {
    final fastTheme =
        context.dependOnInheritedWidgetOfExactType<FastTheme>() as FastTheme;
    // MediaQuery経由で端末のテーマを取得する
    return FastThemeData.from(
        fastTheme, MediaQuery.platformBrightnessOf(context));
  }

  @override
  bool updateShouldNotify(FastTheme oldWidget) =>
      oldWidget.accentColor != accentColor || oldWidget.themeMode != themeMode;
}
