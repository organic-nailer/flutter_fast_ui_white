import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/fast_theme_scope.dart';
import 'package:flutter_fast_ui_white/pages/alerts_page.dart';
import 'package:flutter_fast_ui_white/pages/app_bar_top_page.dart';
import 'package:flutter_fast_ui_white/pages/bottom_navigation_page.dart';
import 'package:flutter_fast_ui_white/pages/button_page.dart';
import 'package:flutter_fast_ui_white/pages/card_page.dart';
import 'package:flutter_fast_ui_white/pages/chips_page.dart';
import 'package:flutter_fast_ui_white/pages/inputs_except_text_page.dart';
import 'package:flutter_fast_ui_white/pages/list_page.dart';
import 'package:flutter_fast_ui_white/pages/typography_page.dart';
import 'package:flutter_fast_ui_white/widgets/fast_app_bar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("ja_JP");
  runApp(FastTheme(
    accentColor: Colors.pink,
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: FastTheme.of(context).theme,
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
    SampleData("Typography", (_) => TypographyPage())
  ];
}

@immutable
class SampleData {
  final String name;
  final Widget Function(BuildContext) builder;
  SampleData(this.name, this.builder);
}
