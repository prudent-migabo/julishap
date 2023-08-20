import 'package:firebase_auth/firebase_auth.dart';
import 'package:julishap_police/data/data.dart';
import 'package:julishap_police/data/models/custom_error.dart';
import 'package:julishap_police/utils/utils.dart';

class AuthRepository{
  FirebaseAuth auth;
  AuthRepository({required this.auth});

  Stream<User?> get user=> auth.userChanges();

  Future<void> login(String email, String password) async {
    try{
      await auth.signInWithEmailAndPassword(email: email, password: password);
    }on FirebaseAuthException catch(e){
      throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    }
    catch(e){
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/Plugin');
    }
  }

  Future register(UserModel userModel, String password) async {
   try{
     final user= await auth.createUserWithEmailAndPassword(email: userModel.email, password: password,);
     userModel.docId=user.user!.uid;
     await usersRef.doc(user.user?.uid).set(userModel.toMap());
   }on FirebaseAuthException catch(e){
     print('ppppppppppppppp${e}');
     throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
   }
   catch(e){
     print('oooooooooooo${e}');
     throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/Plugin');
   }
  }

  Future<UserModel> getUserDetails(String uid) async {
    try{
      UserModel user= await usersRef.doc(uid).get().then((doc) => UserModel.fromDoc(doc));
      return user;
    }on FirebaseAuthException catch(e){
      print('ppppppppppppppp${e}');
      throw CustomError(code: e.code, message: e.message.toString(), plugin: e.plugin);
    }
    catch(e){
      print('oooooooooooo${e}');
      throw CustomError(code: 'Exception', message: e.toString(), plugin: 'Exception/Plugin');
    }
  }

  Future logout()async{
      await auth.signOut();
  }
}