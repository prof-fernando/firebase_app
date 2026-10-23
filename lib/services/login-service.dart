
import 'package:firebase_app/firebase_keys.example.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

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
   static sair(){
    FirebaseAuth.instance.signOut();
   }
   static User? get usuarioLogado =>
     FirebaseAuth.instance.currentUser;
   
   static Stream<User?> get sessao =>
    FirebaseAuth.instance.authStateChanges();


}

