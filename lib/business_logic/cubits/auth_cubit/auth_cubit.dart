import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/data.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthRepository authRepository;
  AuthCubit({required this.authRepository}) : super(AuthState.initial());

  void login(String email, String password)async{
    try{
      emit(state.copyWith(status: AuthStatus.loading));
      await authRepository.login(email, password);
      emit(state.copyWith(status: AuthStatus.success));
    }on CustomError catch(e){
      emit(state.copyWith(status: AuthStatus.error, error: e));
    }
  }

  void register(UserModel user, String password)async{
    try{
      emit(state.copyWith(status: AuthStatus.loading));
      await authRepository.register(user, password);
      emit(state.copyWith(status: AuthStatus.success));
    }on CustomError catch(e){
      emit(state.copyWith(status: AuthStatus.error, error: e));
    }
  }

  void signOut()async{
    try{
      emit(state.copyWith(status: AuthStatus.loading));
      await authRepository.logout();
      emit(state.copyWith(status: AuthStatus.success));
    }on CustomError catch(e){
      emit(state.copyWith(status: AuthStatus.error, error: e));
    }
  }


}
