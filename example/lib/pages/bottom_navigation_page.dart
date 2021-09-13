import 'package:flutter/material.dart';

class BottomNavigationPage extends StatefulWidget {
  const BottomNavigationPage({Key? key}) : super(key: key);

  @override
  _BottomNavigationPageState createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  bool _fixed = true;
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Shifting"),
            Switch(
                value: _fixed,
                onChanged: (v) {
                  setState(() {
                    _fixed = v;
                  });
                }),
            const Text("Fixed")
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: _fixed
            ? BottomNavigationBarType.fixed
            : BottomNavigationBarType.shifting,
        currentIndex: _index,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              tooltip: "to Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search_outlined),
              label: "Search",
              tooltip: "Search Something"),
          BottomNavigationBarItem(
              icon: Icon(Icons.list_outlined),
              label: "List",
              tooltip: "Something List"),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_outlined),
              label: "Settings",
              tooltip: "Some Settings"),
        ],
      ),
    );
  }
}
