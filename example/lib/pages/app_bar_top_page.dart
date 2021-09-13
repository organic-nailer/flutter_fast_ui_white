import 'package:example/components/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class AppBarTopPage extends StatelessWidget {
  const AppBarTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: FastAppBar(
        title: const Text("AppBar Top"),
        actions: [
          const ThemeSwitcher(),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if (index.isOdd) return const Divider();
        return ListTile(
          title: Text("ITEM ${index / 2}"),
        );
      }),
    );
  }
}
