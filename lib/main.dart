import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/pages/app_bar_top_page.dart';
import 'package:flutter_fast_ui_white/pages/bottom_navigation_page.dart';
import 'package:flutter_fast_ui_white/pages/button_page.dart';
import 'package:flutter_fast_ui_white/pages/card_page.dart';
import 'package:flutter_fast_ui_white/pages/inputs_except_text_page.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("ja_JP");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final MaterialColor materialWhite = const MaterialColor(
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
  final Color activeBlack = const Color(0xDE000000);
  final Color inactiveBlack = const Color(0x99000000);
  final Color disabledBlack = const Color(0x61000000);

  static final MaterialColor accentColor = Colors.deepPurple;
  // from: https://material.io/design/interaction/states.html#pressed
  final Color overlayOnDark = const Color(0x52FFFFFF);
  final Color overlayOnLight = const Color(0x29000000);

  final Color borderGrey = const Color(0xFFC8C8C8);

  Color resolveAccentToggleColor(Set<MaterialState> states) {
    if(states.contains(MaterialState.disabled)) return disabledBlack;
    if(states.contains(MaterialState.selected)) return accentColor;
    return inactiveBlack;
  }

  @override
  Widget build(BuildContext context) {
    final accentIsDark = ThemeData.estimateBrightnessForColor(accentColor) == Brightness.dark;
    final typography = Typography.material2018(platform: defaultTargetPlatform);
    final accentTextTheme = accentIsDark ? typography.white : typography.black;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: materialWhite,
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: activeBlack,
          unselectedItemColor: inactiveBlack
        ),
        // buttonTheme は現在使われていないのでボタンごとに指定
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            textStyle: accentTextTheme.button,
            primary: accentColor,
            onPrimary: accentTextTheme.button!.color,
            elevation: 0,
            shadowColor: Colors.transparent
          )
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            primary: accentColor,
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            primary: accentColor
          )
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: accentColor,
          foregroundColor: accentTextTheme.button!.color
        ),
        cardTheme: CardTheme(
          elevation: 0,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderGrey,
              width: 2
            ),
            borderRadius: BorderRadius.circular(8)
          )
        ),
        toggleableActiveColor: accentColor,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.resolveWith(resolveAccentToggleColor)
        ),
        radioTheme: RadioThemeData(
            fillColor: MaterialStateProperty.resolveWith(resolveAccentToggleColor)
        ),
        switchTheme: SwitchThemeData(
          thumbColor: MaterialStateProperty.resolveWith((states) {
            if(states.containsAll([MaterialState.disabled, MaterialState.selected])) return accentColor.shade200;
            if(states.contains(MaterialState.disabled)) return Colors.grey.shade400;
            if(states.contains(MaterialState.selected)) return accentColor.shade600;
            return Colors.grey.shade50;
          }),
          trackColor: MaterialStateProperty.resolveWith((states) {
            if(states.containsAll([MaterialState.disabled, MaterialState.selected])) return accentColor.shade200.withAlpha(128);
            if(states.contains(MaterialState.disabled)) return Color(0xFFC8C8C8);
            if(states.contains(MaterialState.selected)) return accentColor.withAlpha(128);
            return Color(0xFF9B9B9B);
          })
        ),
        sliderTheme: SliderThemeData(
          activeTrackColor: accentColor.shade600,
          inactiveTrackColor: accentColor.withAlpha(128),
          thumbColor: accentColor.shade600,
          disabledActiveTrackColor: accentColor.shade200,
          disabledInactiveTrackColor: Color(0xFFC8C8C8),
          disabledThumbColor: accentColor.shade200,
        ),
        timePickerTheme: TimePickerThemeData(
          dialHandColor: accentColor,

        )
      ),
      home: SampleListPage(),
    );
  }
}

class SampleListPage extends StatelessWidget {
  SampleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("MaterialFastUI White"),),
      body: ListView.builder(
        itemCount: sampleList.length,
        itemBuilder: (context, index) {
          final data = sampleList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: data.builder));
            },
            child: ListTile(
              title: Text(data.name),
            ),
          );
        },
      ),
    );
  }

  final sampleList = <SampleData>[
    SampleData("AppBar:Top", (_) => AppBarTopPage()),
    SampleData("BottomNavigation", (_) => BottomNavigationPage()),
    SampleData("Button", (_) => ButtonPage()),
    SampleData("CardPage", (_) => CardPage()),
    SampleData("Inputs(Text除く)", (_) => InputsExceptTextPage()),
  ];
}

@immutable
class SampleData {
  final String name;
  final Widget Function(BuildContext) builder;
  SampleData(this.name, this.builder);
}
