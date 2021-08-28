import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/pages/app_bar_top_page.dart';
import 'package:flutter_fast_ui_white/pages/bottom_navigation_page.dart';

void main() {
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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: materialWhite,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: activeBlack,
          unselectedItemColor: inactiveBlack
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
  ];
}

@immutable
class SampleData {
  final String name;
  final Widget Function(BuildContext) builder;
  SampleData(this.name, this.builder);
}
