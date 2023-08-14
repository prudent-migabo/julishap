import 'package:bloc/bloc.dart';


class AuthSwitchCubit extends Cubit<bool> {
  AuthSwitchCubit() : super(false);
  void toggle(bool isToggled){
    emit(isToggled);
  }
}
