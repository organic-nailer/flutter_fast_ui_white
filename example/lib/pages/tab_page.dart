import 'package:flutter/material.dart';

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  @override
  _TabPageState createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  final contents = [
    Container(
      height: 48,
      color: Colors.green,
      child: const Center(
        child: Text("Tab1 Content"),
      ),
    ),
    Container(
      height: 48,
      color: Colors.pink,
      child: const Center(
        child: Text("Tab2 Content"),
      ),
    ),
    Container(
      height: 48,
      color: Colors.yellow,
      child: const Center(
        child: Text("Tab3 Content"),
      ),
    ),
  ];
  late final TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: contents.length, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tab"),
        bottom: TabBar(
          controller: _controller,
          tabs: const [
            Tab(
              icon: Icon(Icons.adb),
              text: "Tab1",
            ),
            Tab(
              icon: Icon(Icons.cached),
              text: "Tab2",
            ),
            Tab(
              icon: Icon(Icons.zoom_out_map_sharp),
              text: "Tab3",
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Divider(),
          TabBar(
            controller: _controller,
            tabs: const [
              Tab(
                text: "Tab1",
              ),
              Tab(
                text: "Tab2",
              ),
              Tab(
                text: "Tab3",
              ),
            ],
          ),
          const Divider(),
          TabBar(
            controller: _controller,
            tabs: const [
              Tab(
                icon: Icon(Icons.adb),
              ),
              Tab(
                icon: Icon(Icons.cached),
              ),
              Tab(
                icon: Icon(Icons.zoom_out_map_sharp),
              ),
            ],
          ),
          const Divider(),
          TabBar(
            controller: _controller,
            isScrollable: true,
            tabs: const [
              Tab(
                text: "Tab1",
              ),
              Tab(
                text: "Tab2",
              ),
              Tab(
                text: "Tab3",
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _controller,
              children: contents,
            ),
          )
        ],
      ),
    );
  }
}
