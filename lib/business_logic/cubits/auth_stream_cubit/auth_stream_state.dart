part of 'auth_stream_cubit.dart';

enum AuthStreamStatus{
  authenticated,
  unauthenticated
}

class AuthStreamState extends Equatable {
  AuthStreamStatus streamStatus;

  factory AuthStreamState.initial(){
    return AuthStreamState(streamStatus: AuthStreamStatus.unauthenticated);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [streamStatus];

//<editor-fold desc="Data Methods">
  AuthStreamState({
    required this.streamStatus,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthStreamState &&
          runtimeType == other.runtimeType &&
          streamStatus == other.streamStatus);

  @override
  int get hashCode => streamStatus.hashCode;

  @override
  String toString() {
    return 'AuthStreamState{' + ' streamStatus: $streamStatus,' + '}';
  }

  AuthStreamState copyWith({
    AuthStreamStatus? streamStatus,
  }) {
    return AuthStreamState(
      streamStatus: streamStatus ?? this.streamStatus,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'streamStatus': this.streamStatus,
    };
  }

  factory AuthStreamState.fromMap(Map<String, dynamic> map) {
    return AuthStreamState(
      streamStatus: map['streamStatus'] as AuthStreamStatus,
    );
  }

//</editor-fold>
}


