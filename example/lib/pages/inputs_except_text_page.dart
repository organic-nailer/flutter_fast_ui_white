import 'package:example/components/theme_switcher.dart';
import 'package:flutter/material.dart';
import "package:intl/intl.dart";

class InputsExceptTextPage extends StatefulWidget {
  const InputsExceptTextPage({Key? key}) : super(key: key);

  @override
  _InputsExceptTextPageState createState() => _InputsExceptTextPageState();
}

var formatter = DateFormat('yyyy/MM/dd', "ja_JP");

class _InputsExceptTextPageState extends State<InputsExceptTextPage> {
  bool _isDisabled = false;
  bool _topToggle = false;
  int _radioValue = 1;
  double _sliderValue = 0.5;
  DateTime _date = DateTime.now();
  TimeOfDay _time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Inputs -Text"),
        actions: const [ThemeSwitcher()],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text("Disabled"),
                Checkbox(
                  value: _isDisabled,
                  onChanged: (value) {
                    setState(() {
                      _isDisabled = value ?? false;
                    });
                  },
                )
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Checkbox"),
                Checkbox(
                    value: _topToggle,
                    onChanged: _isDisabled
                        ? null
                        : (value) {
                            setState(() {
                              _topToggle = value ?? false;
                            });
                          }),
                const Text("Switch"),
                Switch(
                    value: _topToggle,
                    onChanged: _isDisabled
                        ? null
                        : (value) {
                            setState(() {
                              _topToggle = value;
                            });
                          }),
              ],
            ),
            const Text("Radio Button"),
            for (int i = 1; i <= 2; i++)
              ListTile(
                  title: Text(
                    'Radio $i',
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  leading: Radio(
                    value: i,
                    groupValue: _radioValue,
                    onChanged: _isDisabled
                        ? null
                        : (int? value) {
                            setState(() {
                              _radioValue = value ?? 1;
                            });
                          },
                  )),
            Slider(
                value: _sliderValue,
                onChanged: _isDisabled
                    ? null
                    : (value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      }),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final result = await showDatePicker(
                        context: context,
                        initialDate: _date,
                        firstDate: DateTime(
                          2010,
                          1,
                          1,
                        ),
                        lastDate: DateTime(2025, 12, 31),
                      );
                      if (result != null) {
                        setState(() {
                          _date = result;
                        });
                      }
                    },
                    child: Text(formatter.format(_date)),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () async {
                      final result = await showTimePicker(
                          context: context, initialTime: _time);
                      if (result != null) {
                        setState(() {
                          _time = result;
                        });
                      }
                    },
                    child: Text(_time.format(context)),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
