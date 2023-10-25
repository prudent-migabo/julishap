import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:julishap_police/business_logic/cubits/auth_stream_cubit/auth_stream_cubit.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/data/repositories/user_repository.dart';
import 'package:julishap_police/presentation/presentation.dart';

class CheckRoleScreen extends StatelessWidget {
  const CheckRoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: context.read<UserRepository>().userDetails(context.read<AuthStreamCubit>().state.uid),
          builder: (context, snapshot){
            if(snapshot.hasData){
              UserModel user= snapshot.data as UserModel;

              if(user.role!=null && user.role=='police'){
                return const HomeScreen();
              }
              else{
                return const Center(
                  child: Text('Utilisateur non permis'),
                );
              }

            }
            else if(snapshot.hasError){

              return const Center(
                child: Text('Une erreur est survenue!'),
              );
            }
            else if(snapshot.connectionState== ConnectionState.waiting){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container();
          }),
    );
  }
}
