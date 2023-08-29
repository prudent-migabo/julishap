import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_civil/business_logic/cubits/cubits.dart';
import 'package:julishap_civil/data/data.dart';
import '../../../utils/utils.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName= '/register';

  RegisterScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();
  TextEditingController _name= TextEditingController();
  TextEditingController _phoneNumber= TextEditingController();



  void _onSubmit(BuildContext context){
    if(!_formKey.currentState!.validate()){
      return;
    }
    context.read<AuthCubit>().register(
        UserModel(
        name: _name.text,
            email: _email.text,
            phoneNumber: _phoneNumber.text,
            ), _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
        listener: (context,state){
          if(state.status==AuthStatus.error){
            errorDialog(context, state.error!);
          }
        },
        builder: (context, state){
      return Scaffold(
        appBar: AppBar(
          title: const Text('Creer Compte'),
        ),
        body: LayoutBuilder(
          builder: (context, constraints){
            return SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                constraints: BoxConstraints.tightFor(height: max(500, constraints.maxHeight)),
                child: Form(
                  key: _formKey,
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
                                controller: _name,
                                  decoration: const InputDecoration(
                                    hintText: 'Nom',
                                    labelText: 'Nom',
                                  ),
                                  validator: (val){
                                    if(val!.isEmpty|| val.trim().isEmpty){
                                      return 'required';
                                    }
                                  }
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                controller: _email,
                                decoration: const InputDecoration(
                                  hintText: 'Email',
                                  labelText: 'Email',
                                ),
                                validator: (val){
                                  if(val!.isEmpty|| val.trim().isEmpty){
                                    return 'required';
                                  }
                                  if(!val.contains('@')){
                                    return 'invalid email';
                                  }
                                },
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                  controller: _phoneNumber,
                                  decoration: const InputDecoration(
                                    hintText: 'Phone Number',
                                    labelText: 'Phone Number',
                                  ),
                                  validator: (val){
                                    if(val!.isEmpty|| val.trim().isEmpty){
                                      return 'required';
                                    }
                                  }
                              ),
                              SizedBox(height: 8,),
                              TextFormField(
                                obscureText: true,
                                  controller: _password,
                                  decoration: const InputDecoration(
                                    hintText: 'Password',
                                    labelText: 'Password',
                                  ),
                                  validator: (val){
                                    if(val!.isEmpty|| val.trim().isEmpty){
                                      return 'required';
                                    }
                                    if(val.trim().length<6){
                                      return "too short";
                                    }
                                  }
                              ),
                              SizedBox(height: 8,),

                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 18)),
                                  onPressed:state.status==AuthStatus.loading?null:(){
                                    _onSubmit(context);
                                  },
                                  child: Text(state.status==AuthStatus.loading?"Loading...":'Creer'))
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
                                context.read<AuthSwitchCubit>().toggle(true);
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
              ),
            );
          },
        ),
      );
    });
  }
}
