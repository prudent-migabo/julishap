part of 'auth_stream_cubit.dart';

enum AuthStreamStatus{
  authenticated,
  unauthenticated
}

class AuthStreamState extends Equatable {
  AuthStreamStatus streamStatus;
  String uid;

  factory AuthStreamState.initial(){
    return AuthStreamState(streamStatus: AuthStreamStatus.unauthenticated, uid: '');
  }

  @override
  // TODO: implement props
  List<Object?> get props => [streamStatus, uid];

//<editor-fold desc="Data Methods">
  AuthStreamState({
    required this.streamStatus,
    required this.uid,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuthStreamState &&
          runtimeType == other.runtimeType &&
          streamStatus == other.streamStatus &&
          uid == other.uid);

  @override
  int get hashCode => streamStatus.hashCode ^ uid.hashCode;

  @override
  String toString() {
    return 'AuthStreamState{' +
        ' streamStatus: $streamStatus,' +
        ' uid: $uid,' +
        '}';
  }

  AuthStreamState copyWith({
    AuthStreamStatus? streamStatus,
    String? uid,
  }) {
    return AuthStreamState(
      streamStatus: streamStatus ?? this.streamStatus,
      uid: uid ?? this.uid,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'streamStatus': this.streamStatus,
      'uid': this.uid,
    };
  }

  factory AuthStreamState.fromMap(Map<String, dynamic> map) {
    return AuthStreamState(
      streamStatus: map['streamStatus'] as AuthStreamStatus,
      uid: map['uid'] as String,
    );
  }

//</editor-fold>
}


