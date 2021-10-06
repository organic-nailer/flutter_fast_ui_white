import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/src/custom_colors.dart';
import 'package:flutter_fast_ui_white/src/fast_theme.dart';

class FastThemeScope extends StatefulWidget {
  final MaterialColor accentColor;
  final ThemeMode themeMode;
  final CustomColors? customColors;
  final MaterialBuilder builder;
  const FastThemeScope(
      {Key? key,
      required this.accentColor,
      required this.themeMode,
      this.customColors,
      required this.builder})
      : super(key: key);

  @override
  _FastThemeScopeState createState() => _FastThemeScopeState();
}

class _FastThemeScopeState extends State<FastThemeScope> {
  late ThemeData lightTheme;
  late ThemeData darkTheme;
  late ThemeMode mode;
  late MaterialColor accentColor;
  @override
  void initState() {
    super.initState();
    lightTheme = _createFastTheme(widget.accentColor);
    darkTheme = _createFastThemeDark(widget.accentColor);
    mode = widget.themeMode;
    accentColor = widget.accentColor;
  }

  @override
  Widget build(BuildContext context) {
    return FastTheme(
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: mode,
      customColors: widget.customColors ?? const EmptyCustomColors(),
      accentColor: accentColor,
      changeAccent: changeAccent,
      changeTheme: changeTheme,
      child: widget.builder(context, lightTheme, darkTheme, mode),
    );
  }

  void changeTheme(Brightness brightness) {
    setState(() {
      mode = brightness == Brightness.light ? ThemeMode.light : ThemeMode.dark;
    });
  }

  void changeAccent(MaterialColor color) {
    setState(() {
      accentColor = color;
      lightTheme = _createFastTheme(color);
      darkTheme = _createFastThemeDark(color);
    });
  }

  ThemeData _createFastTheme(MaterialColor accent) {
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    return ThemeData(
        typography: typography,
        materialTapTargetSize: MaterialTapTargetSize.padded,
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
                secondaryColor: accent,
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
            labelColor: accent,
            unselectedLabelColor: _inactiveBlack,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: accent, width: 2))),
        colorScheme:
            ColorScheme.fromSwatch(primarySwatch: accent, accentColor: accent),
        primarySwatch: accent);
  }

  // WIP
  ThemeData _createFastThemeDark(MaterialColor accent) {
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    return ThemeData(
        typography: typography,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: AppBarTheme(
            backgroundColor: const Color(
                0xFF2C2C2C), // #121212 + 11% overlay( 6dp elevation )
            elevation: 0,
            iconTheme: IconThemeData(color: typography.white.headline5!.color),
            titleTextStyle: typography.white.headline6),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            selectedItemColor: _activeWhite,
            unselectedItemColor: _inactiveWhite),
        // buttonTheme は現在使われていないのでボタンごとに指定
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                elevation: 0, shadowColor: Colors.transparent)),
        cardTheme: CardTheme(
            elevation: 0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        chipTheme: ChipThemeData.fromDefaults(
                secondaryColor: accent.shade200,
                brightness: Brightness.dark,
                labelStyle: typography.white.bodyText1!)
            .copyWith(elevation: 0, pressElevation: 0),
        dividerTheme:
            const DividerThemeData(color: Color(0x1FFFFFFF), thickness: 2),
        inputDecorationTheme: InputDecorationTheme(
            contentPadding:
                const EdgeInsets.only(left: 16, right: 12, top: 12, bottom: 12),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(8.0))),
        tabBarTheme: TabBarTheme(
            labelColor: accent.shade200,
            unselectedLabelColor: _inactiveWhite,
            labelStyle: const TextStyle(fontWeight: FontWeight.bold),
            indicator: UnderlineTabIndicator(
                borderSide: BorderSide(color: accent.shade200, width: 2))),
        toggleableActiveColor: accent.shade200,
        colorScheme: createScheme(accent, Brightness.dark),
        primarySwatch: accent);
  }

  ColorScheme createScheme(
    MaterialColor accentSwatch,
    Brightness brightness,
  ) {
    final bool isDark = brightness == Brightness.dark;
    final Color secondary = accentSwatch.shade200;
    final bool secondaryIsDark = _brightnessFor(secondary) == Brightness.dark;

    return ColorScheme(
      primary: secondary,
      primaryVariant: isDark ? Colors.black : accentSwatch[700]!,
      secondary: secondary,
      secondaryVariant: isDark ? Colors.tealAccent[700]! : accentSwatch[700]!,
      surface: isDark ? Colors.grey[800]! : Colors.white,
      background: isDark ? Colors.grey[700]! : accentSwatch[200]!,
      error: Colors.red[700]!,
      onPrimary: secondaryIsDark ? Colors.white : Colors.black,
      onSecondary: secondaryIsDark ? Colors.white : Colors.black,
      onSurface: isDark ? Colors.white : Colors.black,
      onBackground: secondaryIsDark ? Colors.white : Colors.black,
      onError: isDark ? Colors.black : Colors.white,
      brightness: brightness,
    );
  }

  static Brightness _brightnessFor(Color color) =>
      ThemeData.estimateBrightnessForColor(color);

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
  static const Color _activeWhite = Color(0xDEFFFFFF);
  static const Color _inactiveWhite = Color(0x99FFFFFF);
  // static final Color _disabledWhite = const Color(0x61FFFFFF);

  // static final MaterialColor accentColor = Colors.deepPurple;
  // from: https://material.io/design/interaction/states.html#pressed
  // static final Color _overlayOnDark = const Color(0x52FFFFFF);
  // static final Color _overlayOnLight = const Color(0x29000000);

  static const Color _borderGrey = Color(0xFFC8C8C8);
}
