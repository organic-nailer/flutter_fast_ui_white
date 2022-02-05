# flutter_fast_ui_white

Easy Material White Theme

## Getting Started

in pubspec.yaml
```
dependencies:
  flutter_fast_ui_white:
    git:
      url: https://github.com/organic-nailer/flutter_fast_ui_white
      ref: v0.3
```

```dart
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
```

### v0.1(old version)

```dart
void main() {
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
```

## Specific Widget

- FastAppBar
- FastTextField

## テーマの変更

### change Theme (light <-> dark)

```dart
FastTheme.of(context).changeTheme(Brightness brightness);
```

### change Accent Color

```dart
FastTheme.of(context).changeAccent(MaterialColor color);
```

## カスタムカラーの設定(>= v0.3)

テーマ変更に対応した独自のカラーを設定可能

1.`abstract class CustomColors`を継承したclassを作成

```dart
class MyCustomColors extends CustomColors<MyColors> {
  final MaterialColor _accent;
  MyCustomColors(this._accent)
      : super({
          MyColors.paleBackground: SwitchableColor(
              light: _accent.shade200, dark: _accent.shade800.withAlpha(50)),
          MyColors.paleNonColoredBackground:
              SwitchableColor(light: Color(0xFFEBEBEB), dark: Color(0xFF1F1F1F))
        });
}

enum MyColors { paleNonColoredBackground, paleBackground }
```

2.`FastThemeScope`に追加

```dart
FastThemeScope(
...
  customColors: MyCustomColors(Colors.green),
...
);
```

3.`FastTheme.of(context)`からアクセス

```dart
FastTheme.of(context).getCustomColor<MyColors>(MyColors.paleBackground);
```
