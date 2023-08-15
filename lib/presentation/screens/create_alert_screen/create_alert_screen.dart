import 'package:flutter/material.dart';

import '../../presentation.dart';

class CreateAlerteScreen extends StatefulWidget {
  static const String routeName= '/create-alert';
   const CreateAlerteScreen({Key? key}) : super(key: key);

  @override
  State<CreateAlerteScreen> createState() => _CreateAlerteScreenState();
}

class _CreateAlerteScreenState extends State<CreateAlerteScreen> {

  List<String> alerts=["Vol","Kidnapping","viol", "tentative de Meurtre"," Abus"];
  String alertName='Vol';


  void onChangeAlert(String? alert){
    setState(() {
      alertName=alert!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Creer Alerte'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                isDense: true,
                hintText: 'Nom',
                labelText: 'Nom',
              ),
            ),

            SizedBox(height: 10,),

            DropdownButtonFormField(
              decoration: InputDecoration(
                isDense:true,
              ),
              value: alertName,
                items: alerts.map((e) => DropdownMenuItem(
              value: e,
                child: Text(e))).toList(), onChanged: onChangeAlert),
            SizedBox(height: 10,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 18)),
                onPressed: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
                }
                , child: Text('Envoyer'))

          ],
        ),
      ),
    );
  }
}
