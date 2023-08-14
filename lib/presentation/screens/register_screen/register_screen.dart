import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName= '/register';

  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Creer Compte'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            Expanded(
              child:
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nom',
                        labelText: 'Nom',
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'phone Number',
                        labelText: 'phone Number',
                      ),
                    ),
                    SizedBox(height: 8,),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'password',
                        labelText: 'password',
                      ),
                    ),
                    SizedBox(height: 8,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 18)),
                        onPressed: (){},
                        child: Text('creer'))
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Vous avez deja un compte :'),
                SizedBox(width: 8,),
                GestureDetector(
                    onTap: (){
                    },
                    child: Text('Connectez Vous',
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
