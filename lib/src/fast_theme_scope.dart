import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FastThemeData {
  final MaterialColor accentColor;
  final bool isDark;
  final ThemeData theme;
  final ThemeData darkTheme;
  late final Color nonColoredAccent;
  FastThemeData(this.accentColor, this.isDark, this.theme, this.darkTheme,
      this.nonColoredAccent);

  FastThemeData.from(FastTheme fastTheme, Brightness platformBrightness)
      : accentColor = fastTheme.accentColor,
        isDark = fastTheme.themeMode == ThemeMode.dark ||
            (fastTheme.themeMode == ThemeMode.system &&
                platformBrightness == Brightness.dark),
        theme = fastTheme.theme,
        darkTheme = fastTheme.darkTheme {
    nonColoredAccent = isDark ? Colors.white : Colors.black;
  }
}

class FastTheme extends InheritedWidget {
  final MaterialColor accentColor;
  final ThemeMode themeMode;
  late final ThemeData theme;
  late final ThemeData darkTheme;
  late final Color nonColoredAccent;
  final Widget materialChild;
  FastTheme(
      {Key? key,
      required this.accentColor,
      required this.themeMode,
      required this.materialChild})
      : super(key: key, child: materialChild) {
    theme = _createFastTheme(accentColor);
    darkTheme = _createFastThemeDark(accentColor);
    nonColoredAccent = Colors.black;
  }

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

  ThemeData _createFastTheme(MaterialColor accent) {
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    return ThemeData(
        typography: typography,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: FastTheme.materialWhite,
            elevation: 0,
            iconTheme: IconThemeData(color: typography.black.headline5!.color),
            titleTextStyle: typography.black.headline6),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: _activeBlack,
            unselectedItemColor: _inactiveBlack),
        // buttonTheme は現在使われていないのでボタンごとに指定
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, shadowColor: Colors.transparent)),
        cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: _borderGrey, width: 1),
                borderRadius: BorderRadius.circular(8))),
        chipTheme: ChipThemeData.fromDefaults(
                secondaryColor: accentColor,
                brightness: Brightness.light,
                labelStyle: typography.black.bodyText1!)
            .copyWith(elevation: 0, pressElevation: 0),
        dividerTheme:
            const DividerThemeData(color: Color(0x1F000000), thickness: 2),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.only(left: 16, right: 12, top: 12, bottom: 12),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        tabBarTheme: TabBarTheme(
            labelColor: accentColor,
            unselectedLabelColor: _inactiveBlack,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: accentColor, width: 2))),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: accentColor)
            .copyWith(secondary: accentColor),
        primarySwatch: accentColor);
  }

  // WIP
  ThemeData _createFastThemeDark(MaterialColor accent) {
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    return ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: materialWhite,
            elevation: 0,
            iconTheme: IconThemeData(color: typography.black.headline5!.color),
            titleTextStyle: typography.black.headline6),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: _activeBlack,
            unselectedItemColor: _inactiveBlack),
        // buttonTheme は現在使われていないのでボタンごとに指定
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, shadowColor: Colors.transparent)),
        cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: const BorderSide(color: _borderGrey, width: 1),
                borderRadius: BorderRadius.circular(8))),
        chipTheme: ChipThemeData.fromDefaults(
                secondaryColor: accentColor,
                brightness: Brightness.light,
                labelStyle: typography.black.bodyText1!)
            .copyWith(elevation: 0, pressElevation: 0),
        dividerTheme:
            const DividerThemeData(color: Color(0x1F000000), thickness: 2),
        colorScheme: ColorScheme.fromSwatch(primarySwatch: accentColor)
            .copyWith(secondary: accentColor),
        primarySwatch: accentColor);
  }

  static const MaterialColor materialWhite = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFFFFFFF),
      200: Color(0xFFFFFFFF),
      300: Color(0xFFFFFFFF),
      400: Color(0xFFFFFFFF),
      500: Color(0xFFFFFFFF),
      600: Color(0xFFFFFFFF),
      700: Color(0xFFFFFFFF),
      800: Color(0xFFFFFFFF),
      900: Color(0xFFFFFFFF),
    },
  );
  // from: https://material.io/design/color/text-legibility.html#text-types
  static const Color _activeBlack = Color(0xDE000000);
  static const Color _inactiveBlack = Color(0x99000000);
  // static final Color _disabledBlack = const Color(0x61000000);

  // static final MaterialColor accentColor = Colors.deepPurple;
  // from: https://material.io/design/interaction/states.html#pressed
  // static final Color _overlayOnDark = const Color(0x52FFFFFF);
  // static final Color _overlayOnLight = const Color(0x29000000);

  static const Color _borderGrey = Color(0xFFC8C8C8);
}
