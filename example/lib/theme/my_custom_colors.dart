import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class MyCustomColors extends CustomColors<MyColors> {
  // ignore: unused_field
  final MaterialColor _accent;
  MyCustomColors(this._accent)
      : super({
          MyColors.paleBackground: SwitchableColor(
              light: _accent.shade200, dark: _accent.shade800.withAlpha(50)),
          MyColors.paleNonColoredBackground:
              const SwitchableColor(light: Color(0xFFEBEBEB), dark: Color(0xFF1F1F1F))
        });
}

enum MyColors { paleNonColoredBackground, paleBackground }
