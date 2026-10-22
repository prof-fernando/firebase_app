
import 'package:firebase_app/pages/cadastro-page.dart';
import 'package:firebase_app/services/login-service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final senhaCtrl = TextEditingController();

  abrirTelaCadastro( BuildContext ctx ){
    Navigator.push(
       ctx,
      MaterialPageRoute(builder: (ctx) => CadastroPage() )
    );
    
  }

login() async{
  try{
    await LoginService.entrar(emailCtrl.text, senhaCtrl.text);
    showMensagem('Cadastro realizado com sucesso!', error: false );
  } on FirebaseAuthException catch( erro ){
     print(  erro.code );
     if(erro.code == 'invalid-credential' ){
        showMensagem('Usuário ou senha inválidos' );
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
        title: Text('Login'),
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
            ElevatedButton(onPressed: login, child: Text('Entrar')),
            TextButton(onPressed: (){
              abrirTelaCadastro(context);
            }, child: Text('Cadastre-se'))
          ],
         ) ,

         ) ,
         floatingActionButton: IconButton(
            onPressed: (){
              abrirTelaCadastro(context);
            },
             icon: Icon( Icons.add )  
          ),
    );
  }
}