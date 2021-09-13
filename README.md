# flutter_fast_ui_white

Easy Material White Theme

## Getting Started

in pubspec.yaml
```
dependencies:
  flutter_fast_ui_white:
    git:
      url: https://github.com/organic-nailer/flutter_fast_ui_white
      ref: v0.2
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
