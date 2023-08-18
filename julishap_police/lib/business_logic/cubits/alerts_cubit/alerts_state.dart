part of 'alerts_cubit.dart';

enum AlertsStatus{
  initial,
  loading,success,
  error,
}

class AlertsState extends Equatable {
  AlertsStatus status;
  List<AlertModel> notificationAlerts;
  List<AlertModel> historyAlerts;
  List<AlertModel> declinedAlerts;

  CustomError? customError;

  @override
  // TODO: implement props
  List<Object?> get props => [status,customError,notificationAlerts, historyAlerts,declinedAlerts];

  factory AlertsState.initial(){
    return AlertsState(status: AlertsStatus.initial, notificationAlerts: [],historyAlerts: [],declinedAlerts: []);
  }

//<editor-fold desc="Data Methods">
  AlertsState({
    required this.status,
    required this.notificationAlerts,
    required this.historyAlerts,
    required this.declinedAlerts,
    this.customError,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlertsState &&
          runtimeType == other.runtimeType &&
          status == other.status &&
          notificationAlerts == other.notificationAlerts &&
          historyAlerts == other.historyAlerts &&
          declinedAlerts == other.declinedAlerts &&
          customError == other.customError);

  @override
  int get hashCode =>
      status.hashCode ^
      notificationAlerts.hashCode ^
      historyAlerts.hashCode ^
      declinedAlerts.hashCode ^
      customError.hashCode;

  @override
  String toString() {
    return 'AlertsState{' +
        ' status: $status,' +
        ' notificationAlerts: $notificationAlerts,' +
        ' historyAlerts: $historyAlerts,' +
        ' declinedAlerts: $declinedAlerts,' +
        ' customError: $customError,' +
        '}';
  }

  AlertsState copyWith({
    AlertsStatus? status,
    List<AlertModel>? notificationAlerts,
    List<AlertModel>? historyAlerts,
    List<AlertModel>? declinedAlerts,
    CustomError? customError,
  }) {
    return AlertsState(
      status: status ?? this.status,
      notificationAlerts: notificationAlerts ?? this.notificationAlerts,
      historyAlerts: historyAlerts ?? this.historyAlerts,
      declinedAlerts: declinedAlerts ?? this.declinedAlerts,
      customError: customError ?? this.customError,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'status': this.status,
      'notificationAlerts': this.notificationAlerts,
      'historyAlerts': this.historyAlerts,
      'declinedAlerts': this.declinedAlerts,
      'customError': this.customError,
    };
  }

  factory AlertsState.fromMap(Map<String, dynamic> map) {
    return AlertsState(
      status: map['status'] as AlertsStatus,
      notificationAlerts: map['notificationAlerts'] as List<AlertModel>,
      historyAlerts: map['historyAlerts'] as List<AlertModel>,
      declinedAlerts: map['declinedAlerts'] as List<AlertModel>,
      customError: map['customError'] as CustomError,
    );
  }

//</editor-fold>
}


