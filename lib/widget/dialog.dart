import 'package:flutter/material.dart';

Future<Null> normalDialog(BuildContext context, String string) async {
  showDialog(
      context: context,
      builder: (context) => SimpleDialog(
            title: ListTile(
              leading: Icon(Icons.warning_rounded,size: 50,color: Colors.red),
              title: Text('คำเตือน'),
              subtitle: Text(string),
            ),
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context), child: Text('OK'))
            ],
          ));
}
