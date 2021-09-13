import 'package:example/components/theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class TextFieldPage extends StatefulWidget {
  const TextFieldPage({Key? key}) : super(key: key);

  @override
  _TextFieldPageState createState() => _TextFieldPageState();
}

class _TextFieldPageState extends State<TextFieldPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Text Field"),
        actions: const [ThemeSwitcher()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: const [
              Text("TextField"),
              Divider(),
              FastTextField(),
              FastTextField(
                decoration: FastInputDecoration(
                    labelText: "Label Text",
                    helperText: "Helper",
                    hintText: "Hint Text",
                    icon: Icon(Icons.accessible_forward),
                    suffixIcon: Icon(Icons.close)),
              ),
              FastTextField(
                textAlign: TextAlign.end,
                decoration: FastInputDecoration(
                    labelText: "Label Text",
                    suffixText: "Suffix",
                    icon: Icon(Icons.accessible_forward)),
              ),
              FastTextField(
                decoration: FastInputDecoration(
                    labelText: "Label Text",
                    errorText: "Error",
                    helperText: "Helper",
                    icon: Icon(Icons.access_alarm)),
              ),
              FastTextField(
                minLines: 2,
                maxLines: 5,
                decoration: FastInputDecoration(
                    labelText: "Multiline Text",
                    icon: Icon(Icons.accessible_forward)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
