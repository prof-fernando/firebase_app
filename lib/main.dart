import 'package:firebase_app/firebase_options.dart';
import 'package:firebase_app/login-guard.dart';
import 'package:firebase_app/pages/login-page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
   );
  runApp( MaterialApp(
    title: 'Firebase Integration App',
    home: LoginGuard(),
  )  );
}
