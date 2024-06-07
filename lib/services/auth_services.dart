
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  final FirebaseAuth _firebaseAuth=FirebaseAuth.instance;
  AuthSerivice(){}

  Future<bool> login(String email, String password) async{

    User? _user;

    User? getuser(){
      return _user;
    }

    try{
      final creadential=await _firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(creadential.user !=null){
       _user= creadential.user;
        return true;
      }
    }catch(e){
      print(e);
    }
  return false;
  }
}