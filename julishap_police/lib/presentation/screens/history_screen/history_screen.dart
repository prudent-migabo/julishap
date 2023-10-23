import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/utils/methods_helper.dart';
import '../../../business_logic/cubits/cubits.dart';
import '../../../data/data.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName= '/history';

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertsCubit,AlertsState>(
        listener: (context, state){

        },
        builder: (context, state){

          return state.notificationAlerts.length==0?
          const Center(
            child: Text('Empty'),
          )
              :ListView.separated(
              separatorBuilder: (context, index){
                return SizedBox(height: 5,);
              },
              itemBuilder: (
                  context, index){
                AlertModel alert= state.historyAlerts[index];

                return ListTile(
                  title: Text(alert.reason,style: const TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Chez ${alert.senderName} le ${MethodsHelper.timeFormatter(alert.date)}'),
                  trailing: Text(alert.status=='completed'?'completée':"inconnu",
                    style: TextStyle(color: Colors.green),),
                );
              },
              itemCount: state.historyAlerts.length);
        });
  }
}
