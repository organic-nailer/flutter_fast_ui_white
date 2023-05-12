import 'package:example/components/theme_switcher.dart';
import 'package:example/theme/my_custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class CustomColorPage extends StatelessWidget {
  const CustomColorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Custom Color"),
        actions: const [ThemeSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Text("Pale Background Color"),
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(8),
              color: FastTheme.of(context)
                  .getCustomColor<MyColors>(MyColors.paleBackground),
            ),
            const Text("Pale NonColored Background Color"),
            Container(
              width: 200,
              height: 200,
              padding: const EdgeInsets.all(8),
              color: FastTheme.of(context)
                  .getCustomColor<MyColors>(MyColors.paleNonColoredBackground),
            ),
          ],
        ),
      ),
    );
  }
}
