

import 'package:cloud_firestore/cloud_firestore.dart';

final CollectionReference usersRef= FirebaseFirestore.instance.collection('users');
final CollectionReference alertsRef= FirebaseFirestore.instance.collection('alerts');