
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/models/produto.dart';

class ProdutoService{

  static CollectionReference<Map<String, dynamic>> get  _produtos  {

  return  FirebaseFirestore.instance.collection('produtos');
  }   

  Stream<List<Produto>>  listarProdutos(){
     return 
          _produtos
          .orderBy("nome")
          .snapshots()
          .map( 
             (dados) => dados.docs.map( (p) => Produto.fromDoc(p) ).toList()  
          );
  }
 static  salvarProduto(Produto prod  ) async{
    // atualizar 
    if( prod.id != null  ){
        return  _produtos.doc( prod.id ).update( prod.toMap() );
    }else{
    //adicionar 
        final jsonref =   await _produtos.add(prod.toMap());
        return jsonref.id;
    }
  } 

  static Future<void> removerProduto( String id ){
  return _produtos.doc(id).delete();
 }

}
