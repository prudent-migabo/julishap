import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubits/cubits.dart';
import '../../../data/data.dart';
import '../../../utils/utils.dart';

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
            child: Text('Vide'),
          )
              :ListView.builder(
              itemBuilder: (
                  context, index){
                AlertModel alert= state.historyAlerts[index];

                return ListTile(
                  title: Text(alert.reason,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text(MethodsHelper.timeFormatter(alert.date)),
                  trailing: Text(alert.status=='completed'?'completée':"inconnu",
                    style: const TextStyle(color: Colors.green),),
                );
              },
              itemCount: state.historyAlerts.length);
        });
  }
}
