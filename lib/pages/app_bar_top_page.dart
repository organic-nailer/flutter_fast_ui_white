import 'package:flutter/material.dart';

class AppBarTopPage extends StatelessWidget {
  const AppBarTopPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("AppBar Top"),
        shape: Border(bottom: BorderSide(color: Color.fromARGB(255, 245, 245, 245), width: 1)),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert)),
        ],
      ),
      body: ListView.builder(itemBuilder: (context, index) {
        if(index.isOdd) return Divider();
        return ListTile(title: Text("ITEM ${index / 2}"),);
      }),
    );
  }
}
