import 'package:firebase_app/pages/home-page.dart';
import 'package:firebase_app/pages/login-page.dart';
import 'package:firebase_app/services/login-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginGuard extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: LoginService.sessao,
       builder: ( context, snap ){
        if(snap.connectionState == ConnectionState.waiting ){
          return Center( child: CircularProgressIndicator(), );
        }
        if(snap.hasData){
          return HomePage();
        }
        return LoginPage();

       }

       );
  }
}