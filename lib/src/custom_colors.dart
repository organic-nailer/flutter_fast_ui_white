import 'package:flutter/material.dart';

abstract class CustomColors<T extends Enum> {
  final Map<T, SwitchableColor> _colors;
  const CustomColors(this._colors);

  Color getColor(T target, SwitchableTheme theme) {
    final color = _colors[target];
    assert(color != null);
    switch (theme) {
      case SwitchableTheme.light:
        return color!.light;
      case SwitchableTheme.dark:
        return color!.dark;
    }
  }
}

// ignore: unused_field
enum EmptyColorTargets { _ }

class EmptyCustomColors extends CustomColors<EmptyColorTargets> {
  const EmptyCustomColors() : super(const {});
}

enum SwitchableTheme { light, dark }

class SwitchableColor {
  final Color light;
  final Color dark;
  const SwitchableColor({required this.light, required this.dark});
}
