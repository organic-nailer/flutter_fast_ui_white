import 'package:example/components/theme_switcher.dart';
import 'package:example/pages/alerts_page.dart';
import 'package:example/pages/app_bar_top_page.dart';
import 'package:example/pages/bottom_navigation_page.dart';
import 'package:example/pages/button_page.dart';
import 'package:example/pages/card_page.dart';
import 'package:example/pages/chips_page.dart';
import 'package:example/pages/inputs_except_text_page.dart';
import 'package:example/pages/list_page.dart';
import 'package:example/pages/tab_page.dart';
import 'package:example/pages/text_field_page.dart';
import 'package:example/pages/typography_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting("ja_JP");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FastThemeScope(
        accentColor: Colors.green,
        themeMode: ThemeMode.system,
        builder: (context, lightTheme, darkTheme, mode) {
          return MaterialApp(
            title: 'Fast White Theme',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: mode,
            home: SampleListPage(),
          );
        });
  }
}

class SampleListPage extends StatelessWidget {
  SampleListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FastAppBar(
        title: const Text("MaterialFastUI White"),
        actions: const [ThemeSwitcher()],
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
    SampleData("AppBar:Top", (_) => const AppBarTopPage()),
    SampleData("BottomNavigation", (_) => const BottomNavigationPage()),
    SampleData("Button", (_) => const ButtonPage()),
    SampleData("CardPage", (_) => const CardPage()),
    SampleData("Inputs(Text除く)", (_) => const InputsExceptTextPage()),
    SampleData("Chips", (_) => const ChipsPage()),
    SampleData("Dialogs", (_) => const AlertsPage()),
    SampleData("List", (_) => const ListPage()),
    SampleData("Typography", (_) => const TypographyPage()),
    SampleData("TextField", (_) => const TextFieldPage()),
    SampleData("Tab", (_) => const TabPage())
  ];
}

@immutable
class SampleData {
  final String name;
  final Widget Function(BuildContext) builder;
  const SampleData(this.name, this.builder);
}
