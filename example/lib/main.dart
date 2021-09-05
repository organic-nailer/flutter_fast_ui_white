import 'package:example/pages/alerts_page.dart';
import 'package:example/pages/app_bar_top_page.dart';
import 'package:example/pages/bottom_navigation_page.dart';
import 'package:example/pages/button_page.dart';
import 'package:example/pages/card_page.dart';
import 'package:example/pages/chips_page.dart';
import 'package:example/pages/inputs_except_text_page.dart';
import 'package:example/pages/list_page.dart';
import 'package:example/pages/text_field_page.dart';
import 'package:example/pages/typography_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("ja_JP");
  runApp(FastTheme(
    accentColor: Colors.pink,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final accentColor = Colors.deepOrange;
  final typography = Typography.material2018(platform: defaultTargetPlatform);
  // from: https://material.io/design/color/text-legibility.html#text-types
  static final Color _activeBlack = const Color(0xDE000000);
  static final Color _inactiveBlack = const Color(0x99000000);
  // static final Color _disabledBlack = const Color(0x61000000);

  // static final MaterialColor accentColor = Colors.deepPurple;
  // from: https://material.io/design/interaction/states.html#pressed
  // static final Color _overlayOnDark = const Color(0x52FFFFFF);
  // static final Color _overlayOnLight = const Color(0x29000000);

  static final Color _borderGrey = const Color(0xFFC8C8C8);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: accentColor,
          accentColor: accentColor,
          typography: typography,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(
              backgroundColor: FastTheme.materialWhite,
              backwardsCompatibility: false,
              elevation: 0,
              iconTheme:
                  IconThemeData(color: typography.black.headline5!.color),
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
          dividerTheme:
              DividerThemeData(color: Color(0x1F000000), thickness: 2),
          inputDecorationTheme: InputDecorationTheme(
              contentPadding:
                  EdgeInsets.only(left: 16, right: 12, top: 12, bottom: 12),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0)))),
      home: SampleListPage(),
    );
  }
}

class SampleListPage extends StatelessWidget {
  SampleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FastAppBar(
        title: Text("MaterialFastUI White"),
      ),
      body: ListView.builder(
        itemCount: sampleList.length,
        itemBuilder: (context, index) {
          final data = sampleList[index];
          return InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: data.builder));
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
    SampleData("Chips", (_) => ChipsPage()),
    SampleData("Dialogs", (_) => AlertsPage()),
    SampleData("List", (_) => ListPage()),
    SampleData("Typography", (_) => TypographyPage()),
    SampleData("TextField", (_) => TextFieldPage())
  ];
}

@immutable
class SampleData {
  final String name;
  final Widget Function(BuildContext) builder;
  SampleData(this.name, this.builder);
}
