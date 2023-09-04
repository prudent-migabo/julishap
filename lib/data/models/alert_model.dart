
import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel{
  String uid;
  GeoPoint location;
  String reason;
  String status;
  String date;
  String senderName;

//<editor-fold desc="Data Methods">
  AlertModel({
    required this.uid,
    required this.location,
    required this.reason,
    required this.status,
    required this.date,
    required this.senderName,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AlertModel &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          location == other.location &&
          reason == other.reason &&
          status == other.status &&
          date == other.date &&
          senderName == other.senderName);

  @override
  int get hashCode =>
      uid.hashCode ^
      location.hashCode ^
      reason.hashCode ^
      status.hashCode ^
      date.hashCode ^
      senderName.hashCode;

  @override
  String toString() {
    return 'AlertModel{' +
        ' uid: $uid,' +
        ' location: $location,' +
        ' reason: $reason,' +
        ' status: $status,' +
        ' date: $date,' +
        ' senderName: $senderName,' +
        '}';
  }

  AlertModel copyWith({
    String? uid,
    GeoPoint? location,
    String? reason,
    String? status,
    String? date,
    String? senderName,
  }) {
    return AlertModel(
      uid: uid ?? this.uid,
      location: location ?? this.location,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      date: date ?? this.date,
      senderName: senderName ?? this.senderName,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'location': this.location,
      'reason': this.reason,
      'status': this.status,
      'date': this.date,
      'senderName': this.senderName,
    };
  }

  factory AlertModel.fromMap(DocumentSnapshot doc) {
    final map= doc.data() as Map;

    return AlertModel(
      uid: map['uid'] as String,
      location: map['location'] as GeoPoint,
      reason: map['reason'] as String,
      status: map['status'] as String,
      date: map['date'] as String,
      senderName: map['senderName'] as String,
    );
  }

//</editor-fold>
}