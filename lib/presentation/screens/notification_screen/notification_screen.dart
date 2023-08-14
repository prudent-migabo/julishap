import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName= '/notification';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (
            context, index){
          return ListTile(
            title: Text('Vol'),
            subtitle: Text('19-12-2023 12:10'),
            trailing: Text('received'),
          );
        },
        itemCount: 10);
  }
}
