import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel{
  String name;
  String email;
  String phoneNumber;
  String? docId;
  String? role;

//<editor-fold desc="Data Methods">
  UserModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    this.docId,
    this.role,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is UserModel &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          email == other.email &&
          phoneNumber == other.phoneNumber &&
          docId == other.docId);

  @override
  int get hashCode =>
      name.hashCode ^ email.hashCode ^ phoneNumber.hashCode ^ docId.hashCode;

  @override
  String toString() {
    return 'UserModel{' +
        ' name: $name,' +
        ' email: $email,' +
        ' phoneNumber: $phoneNumber,' +
        ' docId: $docId,' +
        '}';
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? docId,
    String? role,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      docId: docId ?? this.docId,
      role: role?? this.role,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'phoneNumber': this.phoneNumber,
      'docId': this.docId,
      'role':'police',
    };
  }

  factory UserModel.fromDoc(DocumentSnapshot doc) {
    Map map= doc.data() as Map;

    return UserModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      docId: doc.id as String,
      role: map['role'],
    );
  }

//</editor-fold>
}