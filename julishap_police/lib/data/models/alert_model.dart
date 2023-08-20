import 'package:cloud_firestore/cloud_firestore.dart';

class AlertModel{
  String uid;
  GeoPoint location;
  String reason;
  String status;
  String date;
  String senderName;
  String docId;
  String? policeId;
  String? policeName;
  GeoPoint? policeIntialLocation;

//<editor-fold desc="Data Methods">
  AlertModel({
    required this.uid,
    required this.location,
    required this.reason,
    required this.status,
    required this.date,
    required this.senderName,
    required this.docId,
    this.policeId,
    this.policeName,
    this.policeIntialLocation,
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
          senderName == other.senderName &&
          docId == other.docId &&
          policeId == other.policeId &&
          policeName == other.policeName &&
          policeIntialLocation == other.policeIntialLocation);

  @override
  int get hashCode =>
      uid.hashCode ^
      location.hashCode ^
      reason.hashCode ^
      status.hashCode ^
      date.hashCode ^
      senderName.hashCode ^
      docId.hashCode ^
      policeId.hashCode ^
      policeName.hashCode ^
      policeIntialLocation.hashCode;

  @override
  String toString() {
    return 'AlertModel{' +
        ' uid: $uid,' +
        ' location: $location,' +
        ' reason: $reason,' +
        ' status: $status,' +
        ' date: $date,' +
        ' senderName: $senderName,' +
        ' docId: $docId,' +
        ' policeId: $policeId,' +
        ' policeName: $policeName,' +
        ' policeIntialLocation: $policeIntialLocation,' +
        '}';
  }

  AlertModel copyWith({
    String? uid,
    GeoPoint? location,
    String? reason,
    String? status,
    String? date,
    String? senderName,
    String? docId,
    String? policeId,
    String? policeName,
    GeoPoint? policeIntialLocation,
  }) {
    return AlertModel(
      uid: uid ?? this.uid,
      location: location ?? this.location,
      reason: reason ?? this.reason,
      status: status ?? this.status,
      date: date ?? this.date,
      senderName: senderName ?? this.senderName,
      docId: docId ?? this.docId,
      policeId: policeId ?? this.policeId,
      policeName: policeName ?? this.policeName,
      policeIntialLocation: policeIntialLocation ?? this.policeIntialLocation,
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
      'docId': this.docId,
      'policeId': this.policeId,
      'policeName': this.policeName,
      'policeIntialLocation': this.policeIntialLocation,
    };
  }

  Map<String, dynamic> toUpdate() {
    return {
      'status': this.status,
      'policeId': this.policeId,
      'policeName': this.policeName,
      'policeIntialLocation': this.policeIntialLocation,
    };
  }

  factory AlertModel.fromDoc(DocumentSnapshot doc) {
    final map= doc.data() as Map;
    return AlertModel(
      uid: map['uid'] as String,
      location: map['location'] as GeoPoint,
      reason: map['reason'] as String,
      status: map['status'] as String,
      date: map['date'] as String,
      senderName: map['senderName'] as String,
      docId: doc.id as String,
      policeId: map['policeId']??"",
      policeName: map['policeName']??"",
      policeIntialLocation: map['policeIntialLocation'] ?? GeoPoint(0, 0),
    );
  }

//</editor-fold>
}