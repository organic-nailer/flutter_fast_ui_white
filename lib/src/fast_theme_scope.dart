import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class FastTheme extends InheritedWidget {
  final MaterialColor accentColor;
  late final ThemeData theme;
  late final ThemeData darkTheme;
  final Widget child;
  FastTheme({required this.accentColor, required this.child})
      : super(child: child) {
    theme = _createFastTheme(accentColor);
    darkTheme = _createFastThemeDark(accentColor);
  }

  static FastTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<FastTheme>() as FastTheme;

  @override
  bool updateShouldNotify(FastTheme oldWidget) =>
      oldWidget.accentColor != accentColor;

  ThemeData _createFastTheme(MaterialColor accent) {
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    return ThemeData(
        primarySwatch: accentColor,
        accentColor: accentColor,
        typography: typography,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: FastTheme.materialWhite,
            backwardsCompatibility: false,
            elevation: 0,
            iconTheme: IconThemeData(color: typography.black.headline5!.color),
            titleTextStyle: typography.black.headline6),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: _activeBlack,
            unselectedItemColor: _inactiveBlack),
        // buttonTheme は現在使われていないのでボタンごとに指定
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, shadowColor: Colors.transparent)),
        cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: _borderGrey, width: 1),
                borderRadius: BorderRadius.circular(8))),
        chipTheme: ChipThemeData.fromDefaults(
                secondaryColor: accentColor,
                brightness: Brightness.light,
                labelStyle: typography.black.bodyText1!)
            .copyWith(elevation: 0, pressElevation: 0),
        dividerTheme: DividerThemeData(color: Color(0x1F000000), thickness: 2),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                EdgeInsets.only(left: 16, right: 12, top: 12, bottom: 12),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        tabBarTheme: TabBarTheme(
            labelColor: accentColor,
            unselectedLabelColor: _inactiveBlack,
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: accentColor, width: 2))));
  }

  ThemeData _createFastThemeDark(MaterialColor accent) {
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    return ThemeData(
        brightness: Brightness.dark,
        primarySwatch: accentColor,
        accentColor: accentColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
            backgroundColor: materialWhite,
            backwardsCompatibility: false,
            elevation: 0,
            iconTheme: IconThemeData(color: typography.black.headline5!.color),
            titleTextStyle: typography.black.headline6),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
            selectedItemColor: _activeBlack,
            unselectedItemColor: _inactiveBlack),
        // buttonTheme は現在使われていないのでボタンごとに指定
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, shadowColor: Colors.transparent)),
        cardTheme: CardTheme(
            elevation: 0,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: _borderGrey, width: 1),
                borderRadius: BorderRadius.circular(8))),
        chipTheme: ChipThemeData.fromDefaults(
                secondaryColor: accentColor,
                brightness: Brightness.light,
                labelStyle: typography.black.bodyText1!)
            .copyWith(elevation: 0, pressElevation: 0),
        dividerTheme: DividerThemeData(color: Color(0x1F000000), thickness: 2));
  }

  static final MaterialColor materialWhite = const MaterialColor(
    0xFFFFFFFF,
    const <int, Color>{
      50: const Color(0xFFFFFFFF),
      100: const Color(0xFFFFFFFF),
      200: const Color(0xFFFFFFFF),
      300: const Color(0xFFFFFFFF),
      400: const Color(0xFFFFFFFF),
      500: const Color(0xFFFFFFFF),
      600: const Color(0xFFFFFFFF),
      700: const Color(0xFFFFFFFF),
      800: const Color(0xFFFFFFFF),
      900: const Color(0xFFFFFFFF),
    },
  );
  // from: https://material.io/design/color/text-legibility.html#text-types
  static final Color _activeBlack = const Color(0xDE000000);
  static final Color _inactiveBlack = const Color(0x99000000);
  // static final Color _disabledBlack = const Color(0x61000000);

  // static final MaterialColor accentColor = Colors.deepPurple;
  // from: https://material.io/design/interaction/states.html#pressed
  // static final Color _overlayOnDark = const Color(0x52FFFFFF);
  // static final Color _overlayOnLight = const Color(0x29000000);

  static final Color _borderGrey = const Color(0xFFC8C8C8);
}
