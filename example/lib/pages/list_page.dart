import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fast_ui_white/flutter_fast_ui_white.dart';

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FastAppBar(
        title: Text("Lists"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Single Line"),
          ListTile(
            title: Text("Simple"),
          ),
          ListTile(
            title: Text("With leading"),
            leading: Icon(Icons.dangerous),
          ),
          ListTile(
            title: Text("With trailing"),
            trailing: Text("01"),
          ),
          Divider(),
          Text("Single Line"),
          ListTile(
            title: Text("Simple"),
            subtitle: Text('Secondary text'),
          ),
          ListTile(
            title: Text("With"),
            subtitle: Text('Secondary text'),
            leading: Icon(Icons.dangerous),
            trailing: Text("02"),
          ),
          Divider(),
          Text("Three Line"),
          ListTile(
            title: Text("Simple"),
            isThreeLine: true,
            subtitle: Text('Secondary text\nTertiary text'),
          ),
          ListTile(
            title: Text("With"),
            isThreeLine: true,
            subtitle: Text('Secondary text\nTertiary text'),
            leading: Icon(Icons.dangerous),
            trailing: Text("02"),
          ),
          Divider(),
        ],
      ),
    );
  }
}
