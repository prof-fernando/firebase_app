
import 'package:firebase_app/pages/produto-form-page.dart';
import 'package:firebase_app/services/login-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Firebase APP'),
      ),
      body: Center(
        child: ElevatedButton(onPressed: (){
          LoginService.sair();
        }, child: Text('Sair')),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push( 
            context, 
            MaterialPageRoute(builder: (_) => ProdutoFormPage()   )
            );
        },
        child: Icon(Icons.add),
         ),   
    );
  }
}