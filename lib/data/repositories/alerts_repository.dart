import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:julishap_civil/data/data.dart';

import '../../utils/constants.dart';

class AlertsRepository{

  Stream<List<AlertModel>> notificationAlerts(String uid){
    return alertsRef.where('status', isNotEqualTo: 'completed').where('uid',isEqualTo: uid)
        .snapshots().map((snap) =>snap.docs.map((doc) =>AlertModel.fromMap(doc)).toList());
  }

  Stream<List<AlertModel>> historyAlerts(String uid){
    return alertsRef.where('status', isEqualTo: 'completed').where('uid',isEqualTo: uid)
        .snapshots().map((snap) => snap.docs.map((doc) => AlertModel.fromMap(doc)).toList());
  }

  Future sendAnAlert(AlertModel alertModel)async{
    try{
     await alertsRef.add(alertModel.toMap());
    }on FirebaseException catch(e){
      throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    }catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/Plugin');
    }
  }

}