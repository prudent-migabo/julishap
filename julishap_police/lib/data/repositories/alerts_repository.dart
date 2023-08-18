import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:julishap_police/data/data.dart';

import '../../utils/constants.dart';

class AlertsRepository{

  Stream<List<AlertModel>> notificationAlerts(String uid){
    return alertsRef.where('status', isEqualTo: 'pending')
        .snapshots().map((snap) =>snap.docs.map((doc) => AlertModel.fromDoc(doc)).toList());
  }

  Stream<List<AlertModel>> declinedAlerts(String uid){
    return alertsRef.where('status', isEqualTo: 'declined')
        .snapshots().map((snap) =>snap.docs.map((doc) => AlertModel.fromDoc(doc)).toList());
  }

  Stream<List<AlertModel>> historyAlerts(String uid){
    return alertsRef.where('status', isEqualTo: 'completed')
        .snapshots().map((snap) => snap.docs.map((doc) => AlertModel.fromDoc(doc)).toList());
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