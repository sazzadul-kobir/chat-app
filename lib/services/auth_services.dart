
import 'package:firebase_auth/firebase_auth.dart';


class AuthService{
  final FirebaseAuth firebaseAuth=FirebaseAuth.instance;

  User? user;


  AuthService(){
    firebaseAuth.authStateChanges().listen(authStateChangesStreamListener);
  }


  Future<bool> login(String email, String password) async{


    try{
      final creadential=await firebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      if(creadential.user !=null){
       user= creadential.user;
        return true;
      }
    }catch(e){
      print(e);
    }
  return false;
  }


  void authStateChangesStreamListener(User? user){
    if(user !=null){
      this.user=user;
    }else{
      this.user=null;
    }
  }

  Future<bool> logout() async {
    try{
      firebaseAuth.signOut();
      return true;
    }catch(e){

    }
    return false;
  }
}