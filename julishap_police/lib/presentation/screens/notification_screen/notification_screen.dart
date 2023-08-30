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
            :ListView.separated(
          padding: EdgeInsets.only(left: 20, right: 20,top: 15),
              separatorBuilder: (context, index){
                return SizedBox(height: 5,);
              },
            itemBuilder: (
                context, index){
              AlertModel alert= state.notificationAlerts[index];

              return GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, MapScreen.routeName,arguments: alert);
                },
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 0),
                  title: Text(alert.reason,style: TextStyle(fontWeight: FontWeight.bold),),
                  subtitle: Text('Chez ${alert.senderName} le ${alert.date}'),
                  trailing: Text(alert.status=='pending'?'en attente':alert.status=='accepted'?"acceptée":"declinée",
                    style: TextStyle(
                        color: alert.status=='accepted'?
                        Colors.green:
                    alert.status=='declined'?
                    Colors.redAccent.shade200:
                    Colors.grey),
                  ),
                ),
              );
            },
            itemCount: state.notificationAlerts.length);

        });
  }
}
