import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*0.75,
      height: double.infinity,
      color: Colors.white,
      child: ListView(
        children: const [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
            radius: 40,
          ),
          SizedBox(height: 5,),
          Text('Noms',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold),),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Parametres'),
          ),
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Langue'),
          ),
          ListTile(
            leading: Icon(Icons.sunny_snowing),
            title: Text('Theme'),
          ),

        ],
      ),
    );
  }
}
