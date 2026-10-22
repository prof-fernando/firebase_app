
import 'package:firebase_auth/firebase_auth.dart';

class LoginService {

  static criarNovoUsuario( String email, String senha     )  {
    

    return   FirebaseAuth
     .instance
     .createUserWithEmailAndPassword(email: email, password: senha);
    
   }

   static entrar( String email, String senha     )  {
    

    return   FirebaseAuth
     .instance
     .signInWithEmailAndPassword(email: email, password: senha);
    
   }

}

