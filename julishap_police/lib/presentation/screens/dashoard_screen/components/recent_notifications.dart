import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/cubits.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/utils/methods_helper.dart';

class RecentNofication extends StatelessWidget {
  const RecentNofication({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsCubit,AlertsState>(
        builder: (context, state){
      return state.notificationAlerts.length==0?
          Center(
            child: Text('Empty'),
          ): ListView.separated(
          separatorBuilder: (context, index){
            return SizedBox(height: 5,);
          },
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: state.notificationAlerts.length,
          itemBuilder: (context, index){
            AlertModel alert= state.notificationAlerts[index];
            return ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              title: Text(alert.reason,style: TextStyle(fontWeight: FontWeight.bold),),
              subtitle: Text('Chez ${alert.senderName} le ${MethodsHelper.timeFormatter(alert.date)}'),
              trailing: Text(alert.status=='pending'?'en attente':alert.status=='accepted'?"acceptée":"declinée",
                style: TextStyle(
                    color: alert.status=='accepted'?
                    Colors.green:
                    alert.status=='declined'?
                    Colors.redAccent.shade200:
                    Colors.grey),
              ),

            );
          });
    });
  }
}
