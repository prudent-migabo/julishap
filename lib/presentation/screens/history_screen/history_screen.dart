import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName= '/history';

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (
            context, index){
          return ListTile(
            title: Text('Vol'),
            subtitle: Text('19-12-2023 12:10'),
            trailing: Text('completed'),
          );
        },
        itemCount: 10);
  }
}
