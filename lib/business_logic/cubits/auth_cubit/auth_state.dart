part of 'auth_cubit.dart';

enum AuthStatus{
  initial,
  loading,
  success,
  error,
}

class AuthState extends Equatable {
  AuthStatus status;
  CustomError? error= CustomError.initial();

  @override
  // TODO: implement props
  List<Object?> get props => [];

  factory AuthState.initial(){
    return AuthState(status: AuthStatus.initial);
  }

//<editor-fold desc="Data Methods">
  AuthState({
    required this.status,
    this.error,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          error == other.error);

  @override
  int get hashCode => status.hashCode ^ error.hashCode;

  @override
  String toString() {
    return 'AuthState{' + ' status: $status,' + ' error: $error,' + '}';
  }

  AuthState copyWith({
    AuthStatus? status,
    CustomError? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': this.status,
      'error': this.error,
    };
  }

  factory AuthState.fromMap(Map<String, dynamic> map) {
    return AuthState(
      status: map['status'] as AuthStatus,
      error: map['error'] as CustomError,
    );
  }

//</editor-fold>
}


