import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/cubits.dart';

class DeclinedAlerts extends StatelessWidget {
  const DeclinedAlerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlertsCubit,AlertsState>(
        builder: (context, state){
          String length=state.declinedAlerts.length.toString()?? '0';
      return  Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(),
        ),
        child: AspectRatio(
          aspectRatio: 1,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(length,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 32),),
                const Text('Alertes  refusees')
              ],
            ),
          ),
        ),
      );
    });
  }
}
