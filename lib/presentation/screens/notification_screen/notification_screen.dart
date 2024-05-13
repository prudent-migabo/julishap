import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_civil/business_logic/cubits/cubits.dart';
import 'package:julishap_civil/data/data.dart';
import 'package:julishap_civil/utils/methods_helper.dart';

class NotificationScreen extends StatelessWidget {
  static const String routeName= '/notification';

  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertsCubit,AlertsState>(
      listener: (context, state){

      },
        builder: (context, state){

        return  state.notificationAlerts.length==0?
            const Center(
              child: Text('Vide'),
            )
            :ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            itemBuilder: (
                context, index){
              AlertModel alert= state.notificationAlerts[index];

              return ListTile(
                title: Text(alert.reason,style: const TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(MethodsHelper.timeFormatter(alert.date)),
                trailing: Text(alert.status=='pending'?'en attente':alert.status=='accepted'?"acceptée":"declinée",
                  style: TextStyle(color: alert.status=='accepted'?Colors.green:Colors.grey),),
              );
            },
            itemCount: state.notificationAlerts.length);

        });
  }
}
