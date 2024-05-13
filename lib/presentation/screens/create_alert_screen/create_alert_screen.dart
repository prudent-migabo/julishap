import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:julishap_civil/business_logic/cubits/cubits.dart';
import 'package:julishap_civil/data/data.dart';
import 'package:julishap_civil/presentation/widgets/custom_button.dart';
import 'package:julishap_civil/utils/error_dialog.dart';
import 'package:latlong2/latlong.dart';

import '../../presentation.dart';

class CreateAlerteScreen extends StatefulWidget {
  static const String routeName= '/create-alert';
  LatLng location;
   CreateAlerteScreen({Key? key,required this.location}) : super(key: key);

  @override
  State<CreateAlerteScreen> createState() => _CreateAlerteScreenState();
}

class _CreateAlerteScreenState extends State<CreateAlerteScreen> {

  List<String> alerts=["Kidnapping","Vol", "Tentative de meurtre","Abus", "Viol", "Agression", "Fraude", "Corruption", "Violation des droits humains"];
  String alertName='Kidnapping';


  void onChangeAlert(String? alert){
    setState(() {
      alertName=alert!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AlertsCubit, AlertsState>(
      listener: (context, state){
        if(state.status== AlertsStatus.error){
          errorDialog(context, state.customError!);
        }
        if(state.status==AlertsStatus.success){
           Fluttertoast.showToast(msg: 'Créer avec succès allez à la notification',
               backgroundColor: Colors.green, toastLength: Toast.LENGTH_SHORT,textColor: Colors.white);
        }
      },
      builder: (context, state){
      return Scaffold(
        appBar: AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back, color: Colors.white,),),
          title: const Text('Créer alerte'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // TextFormField(
              //   decoration: const InputDecoration(
              //     isDense: true,
              //     hintText: 'Nom',
              //     labelText: 'Nom',
              //   ),
              // ),

              const SizedBox(height: 10,),

              DropdownButtonFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                    isDense:true,
                  ),
                  value: alertName,
                  items: alerts.map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: const TextStyle(fontSize: 14),))).toList(), onChanged: onChangeAlert),
              const SizedBox(height: 10,),
              CustomButton(
                onPressed: state.status==AlertsStatus.loading? (){} : (){
                  context.read<AlertsCubit>().sendAlert(AlertModel(
                      senderName: '',
                      uid: context.read<AuthStreamCubit>().state.uid,
                      location: GeoPoint(widget.location.latitude,widget.location.longitude),
                      reason: alertName,
                      status: 'pending',
                      date: DateTime.now().toIso8601String()));
                },
                text: state.status==AlertsStatus.loading?'Patientez...':'Envoyer',
              ),
            ],
          ),
        ),
      );
    },);
  }
}
