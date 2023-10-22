
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/utils/constants.dart';

class UserRepository{

  Stream userDetails(String uid){
    return usersRef.doc(uid).snapshots().map((doc) => UserModel.fromDoc(doc));
  }
}