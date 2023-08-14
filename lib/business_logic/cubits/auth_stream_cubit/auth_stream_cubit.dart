import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../../data/data.dart';
part 'auth_stream_state.dart';

class AuthStreamCubit extends Cubit<AuthStreamState> {
  AuthRepository authRepository;
  AuthStreamCubit({required this.authRepository}) : super(AuthStreamState.initial()){
    streamSubscription=authRepository.user.listen((user) {
      onChanged(user);
    });
  }
  StreamSubscription? streamSubscription;

  void onChanged(User? user){
     if(user!=null){
       emit(state.copyWith(streamStatus: AuthStreamStatus.authenticated));
     }
     else{
       emit(state.copyWith(streamStatus: AuthStreamStatus.unauthenticated));
     }
  }
}
