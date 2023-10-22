import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/auth_stream_cubit/auth_stream_cubit.dart';
import 'package:julishap_police/business_logic/cubits/auth_switch_cubit/auth_switch_cubit.dart';
import 'package:julishap_police/presentation/presentation.dart';

class Wrapper extends StatefulWidget {
  static const String routeName='/';
  const Wrapper({Key? key}) : super(key: key);

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthStreamCubit,AuthStreamState>(
        builder: (context,state){
             if(state.streamStatus==AuthStreamStatus.authenticated){
               return const CheckRoleScreen();
             }
            return BlocBuilder<AuthSwitchCubit,bool>(
                builder: (context,state){
                  if(state==true){
                    return LoginScreen();
                  }else{
                    return RegisterScreen();
                  }
                });
    });
  }
}
