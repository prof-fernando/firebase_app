
import 'package:firebase_app/services/login-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final emailCtrl = TextEditingController();
  final senhaCtrl = TextEditingController();

 cadastrarNovoUsuario() async{
  try{
    await LoginService.criarNovoUsuario(emailCtrl.text, senhaCtrl.text);
    showMensagem('Cadastro realizado com sucesso!', error: false );
  } on FirebaseAuthException catch( erro ){
     print(  erro.code );
     if(erro.code == 'invalid-email' ){
        showMensagem('Endereço de e-mail inválido!' );
     } else if(erro.code == 'weak-password' ) {
      showMensagem('A senha precisa ter pelo menos 6 caracteres' );
     }else if(erro.code == 'email-already-in-use' ) {
      showMensagem('Endereço de e-mail em uso por outra pessoa!' );
     }


  }
 }

  showMensagem(String msg, {bool error = true} ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
         content: Text(msg), 
         backgroundColor: error ?  Colors.red : Colors.green
         )
     );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        title: Text('Cadastro'),
       ),
       body: Padding(
         padding: EdgeInsets.all(20),
         child: Column(
          children: [
            TextField(
              controller: emailCtrl,
              decoration: InputDecoration( 
                label: Text('E-mail:') 
                 ),
            ),
            SizedBox(
              height: 10,
            ),
             TextField(
              controller: senhaCtrl,
              obscureText: true,
              decoration: InputDecoration( 
                label: Text('Senha:') 
                 ),
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(onPressed: cadastrarNovoUsuario, child: Text('Cadastrar')),
            
          ],
         ) ,

         ) ,
        
    );
  }
}