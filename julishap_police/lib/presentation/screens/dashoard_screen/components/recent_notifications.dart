import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/cubits.dart';
import 'package:julishap_police/data/data.dart';

class RecentNofication extends StatelessWidget {
  const RecentNofication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsCubit,AlertsState>(
        builder: (context, state){
      return state.notificationAlerts.length==0?
          Center(
            child: Text('Empty'),
          ): ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.notificationAlerts.length,
          itemBuilder: (context, index){
            AlertModel alert= state.notificationAlerts[index];
            return ListTile(
              title: Text(alert.reason,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('Chez ${alert.senderName} le ${alert.date}'),
              trailing: Text(alert.status),
            );
          });
    });
  }
}
