import 'dart:math';

import 'package:flutter/material.dart';
import 'package:julishap_civil/presentation/presentation.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName= '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Se Connecter'),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child:
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        isDense:true,
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 12,),
                    TextFormField(
                      decoration: const InputDecoration(
                        isDense:true,
                        hintText: 'Password',
                        labelText: 'Password',
                      ),
                    ),
                    SizedBox(height: 15,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 18)),
                        onPressed: (){},
                        child: Text('se connecter')),

                  ],
                ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Aucun Compte :'),
                SizedBox(width: 8,),
                GestureDetector(
                  onTap: (){
                    Navigator.pushNamed(context, RegisterScreen.routeName);
                  },
                    child: Text('Creer',
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold),)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
