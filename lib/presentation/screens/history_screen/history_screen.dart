import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/cubits/cubits.dart';

class HistoryScreen extends StatelessWidget {
  static const String routeName= '/history';

  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertsCubit,AlertsState>(
        listener: (context, state){

        },
        builder: (context, state){
          if(state.status==AlertsStatus.loading){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state.status==AlertsStatus.success){
            return ListView.builder(
                itemBuilder: (
                    context, index){
                  return ListTile(
                    title: Text('Vol'),
                    subtitle: Text('19-12-2023 12:10'),
                    trailing: Text('received'),
                  );
                },
                itemCount: state.historyAlerts.length);

          }
          return Center(
            child: Text('Empty'),
          );
        });
  }
}
