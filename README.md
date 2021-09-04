# flutter_fast_ui_white

Easy Material White Theme

## Getting Started

in pubspec.yaml
```
dependencies:
  flutter_fast_ui_white:
    git:
      url: https://github.com/organic-nailer/flutter_fast_ui_white
```

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

### Specific Widget

- FastAppBar
- showFastTimePicker
- showFastDatePicker
