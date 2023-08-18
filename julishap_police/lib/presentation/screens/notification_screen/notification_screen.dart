import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/cubits.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/presentation/screens/screens.dart';

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
            Center(
              child: Text('Empty'),
            )
            :ListView.builder(
            itemBuilder: (
                context, index){
              AlertModel alert= state.notificationAlerts[index];

              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, MapScreen.routeName,arguments: alert);
                },
                child: ListTile(
                  title: Text(alert.reason,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Chez ${alert.senderName} le ${alert.date}'),
                  trailing: Text(alert.status,
                    style: TextStyle(color: alert.status=='accepted'?Colors.green:Colors.grey),),
                ),
              );
            },
            itemCount: state.notificationAlerts.length);

        });
  }
}
