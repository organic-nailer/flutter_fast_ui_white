import 'package:example/components/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  _ButtonPageState createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  bool _isDisabled = false;
  bool _withIcon = false;
  bool _extended = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buttons"),
        actions: const [ThemeSwitcher()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const Text("disabled"),
                  Checkbox(
                      value: _isDisabled,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _isDisabled = value;
                          });
                        }
                      }),
                  const Text("withIcon"),
                  Checkbox(
                      value: _withIcon,
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _withIcon = value;
                          });
                        }
                      }),
                ],
              ),
              const Text("Expanded"),
              _withIcon
                  ? ElevatedButton.icon(
                      onPressed: _isDisabled ? null : () {},
                      label: const Text("Elevated"),
                      icon: const Icon(Icons.view_compact_outlined),
                    )
                  : ElevatedButton(
                      onPressed: _isDisabled ? null : () {},
                      child: const Text("Elevated")),
              _withIcon
                  ? OutlinedButton.icon(
                      onPressed: _isDisabled ? null : () {},
                      label: const Text("Outlined"),
                      icon: const Icon(Icons.offline_bolt_outlined),
                    )
                  : OutlinedButton(
                      onPressed: _isDisabled ? null : () {},
                      child: const Text("Outlined")),
              _withIcon
                  ? TextButton.icon(
                      onPressed: _isDisabled ? null : () {},
                      label: const Text("Text"),
                      icon: const Icon(Icons.face_outlined),
                    )
                  : TextButton(
                      onPressed: _isDisabled ? null : () {},
                      child: const Text("Text")),
              const Text("Horizontal"),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _isDisabled ? null : () {},
                      child: const Text("Text")),
                  const SizedBox(
                    width: 16,
                  ),
                  OutlinedButton(
                      onPressed: _isDisabled ? null : () {},
                      child: const Text("Outlined")),
                ],
              ),
              const Text("Flex"),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                      flex: 1,
                      child: OutlinedButton(
                          onPressed: _isDisabled ? null : () {},
                          child: const Text("Outlined"))),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          onPressed: _isDisabled ? null : () {},
                          child: const Text("Elevated"))),
                ],
              ),
              const Text("nonColored"),
              Wrap(
                children: [
                  TextButton(
                    onPressed: _isDisabled ? null : () {},
                    child: const Text("Text"),
                    style: TextButton.styleFrom(
                        foregroundColor: FastTheme.of(context).nonColoredAccent),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  OutlinedButton(
                    onPressed: _isDisabled ? null : () {},
                    child: const Text("Outlined"),
                    style: OutlinedButton.styleFrom(
                        foregroundColor: FastTheme.of(context).nonColoredAccent),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  ElevatedButton(
                    onPressed: _isDisabled ? null : () {},
                    child: const Text("Elevated"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: FastTheme.of(context).nonColoredAccent),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      floatingActionButton: _extended
          ? FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  _extended = false;
                });
              },
              label: const Text("Extended"),
              icon: const Icon(Icons.add),
            )
          : FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _extended = true;
                });
              },
            ),
    );
  }
}
