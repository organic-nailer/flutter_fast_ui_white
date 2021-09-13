import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({Key? key}) : super(key: key);

  @override
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool isDark = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    isDark = FastTheme.of(context).isDark;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Text("Light", style: Theme.of(context).textTheme.bodyText1),
          Switch(
              value: isDark,
              onChanged: (value) {
                FastTheme.of(context)
                    .changeTheme(value ? Brightness.dark : Brightness.light);
                setState(() {
                  isDark = value;
                });
              }),
          Text("Dark", style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
