

import 'package:cloud_firestore/cloud_firestore.dart';

class Produto{
  String?  id;
  String nome;
  double preco;
  int estoque;

   Produto({
    this.id, 
    required this.nome,
    required this.preco,
    required this.estoque
   }
   );

   Map<String, dynamic> toMap(){
    return {
         'nome' : this.nome,
         'preco' : this.preco,
         'estoque': this.estoque
    };
   }

   factory  Produto.fromDoc( DocumentSnapshot<Map<String,dynamic >> doc ){
    final dados = doc.data()!;
    return Produto(
      id: doc.id,
      nome: dados['nome'],
      preco : dados['preco'],
      estoque: dados['estoque']
    );
   }
}