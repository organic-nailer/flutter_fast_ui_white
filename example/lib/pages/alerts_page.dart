import 'package:flutter/material.dart';

class AlertsPage extends StatelessWidget {
  const AlertsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => _alertDialog(context));
                },
                child: const Text("Alert Dialog")),
            OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) => _simpleDialog(context));
                },
                child: const Text("Simple Dialog")),
            const OutlinedButton(
                onPressed: null,
                // onPressed: () {
                //   showDialog(
                //       context: context,
                //       builder: (context) => _confirmationDialog(context));
                // },
                child: Text("Confirmation Dialog")),
            OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) =>
                          const FullScreenDialog(),
                      fullscreenDialog: true,
                    ),
                  );
                },
                child: const Text("Full-Screen Dialog")),
          ],
        ),
      ),
    );
  }

  AlertDialog _alertDialog(BuildContext context) => AlertDialog(
        title: const Text('Reset settings?'),
        content: const Text(
            'This will reset your device to its default factory settings.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('CANCEL'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('ACCEPT'),
          ),
        ],
      );

  SimpleDialog _simpleDialog(BuildContext context) => SimpleDialog(
        title: const Text('Set backup account'),
        children: [
          SimpleDialogItem(
            icon: Icons.account_circle,
            color: Colors.orange,
            text: 'user01@gmail.com',
            onPressed: () {
              Navigator.pop(context, 'user01@gmail.com');
            },
          ),
          SimpleDialogItem(
            icon: Icons.account_circle,
            color: Colors.green,
            text: 'user02@gmail.com',
            onPressed: () {
              Navigator.pop(context, 'user02@gmail.com');
            },
          ),
          SimpleDialogItem(
            icon: Icons.add_circle,
            color: Colors.grey,
            text: 'Add account',
            onPressed: () {
              Navigator.pop(context, 'user02@gmail.com');
            },
          ),
        ],
      );

  // int? _confirmationDialogIndex;
  // Widget _confirmationDialog(BuildContext context) => Dialog(
  //   backgroundColor: Colors.red,
  //   child: StatefulBuilder(builder: (context, setState) {
  //     return Column(
  //       children: [
  //         Text("Title"),
  //         Divider(),
  //         Container(
  //           height: 200,
  //           child: SingleChildScrollView(
  //             child: ListView.builder(
  //                 itemBuilder: (context, index) => ListTile(
  //                   leading: Radio(
  //                     value: index,
  //                     groupValue: _confirmationDialogIndex,
  //                     onChanged: (int? value) {
  //                       setState(() {
  //                         _confirmationDialogIndex = value;
  //                       });
  //                     },
  //                   ),
  //                   title: Text("Selection $index"),
  //                 )),
  //           ),
  //         ),
  //         Divider(),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.end,
  //           children: [
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text("Cancel")),
  //             SizedBox(
  //               width: 16,
  //             ),
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.of(context).pop();
  //                 },
  //                 child: Text("OK")),
  //           ],
  //         )
  //       ],
  //     );
  //   }),
  // );
}

class SimpleDialogItem extends StatelessWidget {
  const SimpleDialogItem(
      {Key? key,
      required this.icon,
      required this.color,
      required this.text,
      required this.onPressed})
      : super(key: key);

  final IconData icon;
  final Color color;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SimpleDialogOption(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 36.0, color: color),
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            child: Text(text),
          ),
        ],
      ),
    );
  }
}

class FullScreenDialog extends StatelessWidget {
  const FullScreenDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Full-screen Dialog'),
      ),
      body: const Center(
        child: Text("Full-screen dialog"),
      ),
    );
  }
}
