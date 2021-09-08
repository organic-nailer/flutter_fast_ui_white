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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text("disabled"),
                    Checkbox(
                        value: _isDisabled,
                        onChanged: (value) {
                          if (value != null) {
                            setState(() {
                              _isDisabled = value;
                            });
                          }
                        }),
                    Text("withIcon"),
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
                Text("Expanded"),
                _withIcon
                    ? ElevatedButton.icon(
                        onPressed: _isDisabled ? null : () {},
                        label: Text("Elevated"),
                        icon: Icon(Icons.view_compact_outlined),
                      )
                    : ElevatedButton(
                        onPressed: _isDisabled ? null : () {},
                        child: Text("Elevated")),
                _withIcon
                    ? OutlinedButton.icon(
                        onPressed: _isDisabled ? null : () {},
                        label: Text("Outlined"),
                        icon: Icon(Icons.offline_bolt_outlined),
                      )
                    : OutlinedButton(
                        onPressed: _isDisabled ? null : () {},
                        child: Text("Outlined")),
                _withIcon
                    ? TextButton.icon(
                        onPressed: _isDisabled ? null : () {},
                        label: Text("Text"),
                        icon: Icon(Icons.face_outlined),
                      )
                    : TextButton(
                        onPressed: _isDisabled ? null : () {},
                        child: Text("Text")),
                Text("Horizontal"),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: _isDisabled ? null : () {},
                        child: Text("Text")),
                    SizedBox(
                      width: 16,
                    ),
                    OutlinedButton(
                        onPressed: _isDisabled ? null : () {},
                        child: Text("Outlined")),
                  ],
                ),
                Text("Flex"),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                        flex: 1,
                        child: OutlinedButton(
                            onPressed: _isDisabled ? null : () {},
                            child: Text("Outlined"))),
                    SizedBox(
                      width: 16,
                    ),
                    Expanded(
                        flex: 2,
                        child: ElevatedButton(
                            onPressed: _isDisabled ? null : () {},
                            child: Text("Elevated"))),
                  ],
                ),
                Text("nonColored"),
                Wrap(
                  children: [
                    TextButton(
                      onPressed: _isDisabled ? null : () {},
                      child: Text("Text"),
                      style: TextButton.styleFrom(
                          primary: FastTheme.of(context).nonColoredAccent),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    OutlinedButton(
                      onPressed: _isDisabled ? null : () {},
                      child: Text("Outlined"),
                      style: OutlinedButton.styleFrom(
                          primary: FastTheme.of(context).nonColoredAccent),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    ElevatedButton(
                      onPressed: _isDisabled ? null : () {},
                      child: Text("Elevated"),
                      style: ElevatedButton.styleFrom(
                          primary: FastTheme.of(context).nonColoredAccent),
                    ),
                  ],
                )
              ],
            ),
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
              label: Text("Extended"),
              icon: Icon(Icons.add),
            )
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  _extended = true;
                });
              },
            ),
    );
  }
}
