import 'package:flutter/material.dart';

class ChipsPage extends StatefulWidget {
  const ChipsPage({Key? key}) : super(key: key);

  @override
  _ChipsPageState createState() => _ChipsPageState();
}

class _ChipsPageState extends State<ChipsPage> {
  final _choiceChips = [
    ChoiceChipData("Choice1", true),
    ChoiceChipData("Choice2", false),
    ChoiceChipData("Choice3", false),
  ];
  final _filterChips = [
    FilterChipData("Filter1", true),
    FilterChipData("Filter2", false),
    FilterChipData("Filter3", false),
  ];
  final _actionChips = [
    ActionChipData(const Icon(Icons.favorite_outline), "Action1"),
    ActionChipData(
        const CircleAvatar(
          backgroundImage: AssetImage("assets/panda.jpg"),
        ),
        "Action2"),
    ActionChipData(
        const CircleAvatar(
          backgroundColor: Colors.orange,
          child: Text("F"),
        ),
        "Action3"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chips"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Input chips (Not implemented)"),
            Wrap(),
            const Divider(),
            const Text("Choice chips"),
            Wrap(
                children: _choiceChips
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ChoiceChip(
                            label: Text(e.label),
                            selected: e.selected,
                            onSelected: (value) {
                              setState(() {
                                e.selected = value;
                              });
                            },
                          ),
                        ))
                    .toList()),
            const Text("Filter chips"),
            Wrap(
                children: _filterChips
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: FilterChip(
                            label: Text(e.label),
                            selected: e.selected,
                            onSelected: (value) {
                              setState(() {
                                e.selected = value;
                              });
                            },
                          ),
                        ))
                    .toList()),
            const Text("Action chips"),
            Wrap(
                children: _actionChips
                    .map((e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: ActionChip(
                            avatar: e.avatar,
                            label: Text(e.label),
                            onPressed: () {},
                          ),
                        ))
                    .toList()),
          ],
        ),
      ),
    );
  }
}

class ChoiceChipData {
  final String label;
  bool selected;
  ChoiceChipData(this.label, this.selected);
}

class FilterChipData {
  final String label;
  bool selected;
  FilterChipData(this.label, this.selected);
}

class ActionChipData {
  final Widget avatar;
  final String label;
  ActionChipData(this.avatar, this.label);
}
