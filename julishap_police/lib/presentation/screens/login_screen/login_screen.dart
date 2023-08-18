import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/utils/utils.dart';
import '../../../business_logic/cubits/cubits.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName= '/login';
  LoginScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  TextEditingController _email= TextEditingController();
  TextEditingController _password= TextEditingController();

  void _onSubmit(BuildContext context){
    if(!_formKey.currentState!.validate()){
      return;
    }
   context.read<AuthCubit>().login(_email.text, _password.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit,AuthState>(
      listener: (context, state){
        if(state.status==AuthStatus.error){
          errorDialog(context, state.error!);
        }
      },
      builder: (context, state){
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
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: _email,
                        decoration: const InputDecoration(
                          isDense:true,
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
                      SizedBox(height: 12,),
                      TextFormField(
                        controller: _password,
                        decoration: const InputDecoration(
                          isDense:true,
                          hintText: 'Password',
                          labelText: 'Password',
                        ),
                        validator: (val){
                      if(val!.isEmpty|| val.trim().isEmpty){
                      return 'required';
                        }
                       }
                      ),
                      SizedBox(height: 15,),

                      ElevatedButton(
                          style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 18)),
                          onPressed: state.status==AuthStatus.loading?null:(){
                            _onSubmit(context);
                          },
                          child: Text(state.status==AuthStatus.loading?"loading...":'se connecter')),

                    ],
                  ),
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Aucun Compte :'),
                  SizedBox(width: 8,),
                  GestureDetector(
                      onTap: (){
                        context.read<AuthSwitchCubit>().toggle(false);
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
    },);
  }
}
