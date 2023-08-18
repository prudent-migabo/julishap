import 'package:flutter/material.dart';
import 'package:julishap_police/presentation/screens/dashoard_screen/components/components.dart';

class DashBoardScreen extends StatelessWidget {
  static const String routeName='/dashboard';
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: ListView(
        padding: EdgeInsets.only(left: 15, right: 15, top: 15),
        children: [
          const Row(
            children: [
             Expanded(
                 child:CompletedAlerts()
             ),
              SizedBox(width: 10,),
              Expanded(
                child:DeclinedAlerts()
              ),

            ],
          ),
          const SizedBox(height: 20,),
          const Text('Notifications Recentes',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
          RecentNofication()
        ],
      ),
    );
  }
}
