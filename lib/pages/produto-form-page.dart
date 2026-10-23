


import 'package:firebase_app/models/produto.dart';
import 'package:firebase_app/services/produto-service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProdutoFormPage extends StatefulWidget {
 
  
   Produto? prod;
 
    ProdutoFormPage({super.key, this.prod});


  @override
  State<ProdutoFormPage> createState() => _ProdutoFormPageState();
}

class _ProdutoFormPageState extends State<ProdutoFormPage> {
  final nomeCtrl = TextEditingController();
  final precoCtrl = TextEditingController();
  final estoqueCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar( title: Text('Produto'), ),
      body:  Padding(
        padding:  EdgeInsets.all(20),
        child: Column( 
          children: [ 
            TextField(
              controller: nomeCtrl,
              decoration: InputDecoration(
                label: Text('Nome produto:')
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller: precoCtrl,
              decoration: InputDecoration(
                label: Text('Preço:')
              ),
            ),
            SizedBox(height: 20,),
            TextField(
              controller:estoqueCtrl,
              decoration: InputDecoration(
                label: Text('Quantidade em estoque:')
              ),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
              onPressed: (){

                if( widget.prod == null  ){
                  widget.prod =   Produto(
                    nome: nomeCtrl.text,
                    preco: double.parse( precoCtrl.text ),
                    estoque: int.parse( estoqueCtrl.text )   
                  )  ;
                }else{
                  widget.prod!.nome = nomeCtrl.text;
                    widget.prod!.preco = double.parse( precoCtrl.text );
                    widget.prod!.estoque = int.parse( estoqueCtrl.text )   ;
                }

                
                try{
                    ProdutoService.salvarProduto(widget.prod!)
                    .then( (ref) => {
                       if( ref != null ){
                        widget.prod!.id = ref!
                       }
                       
                    } );
                    this.showMensagem(
                      'Item salvo com sucesso',
                      error: false
                    );
                } catch ( erro  ){
                  this.showMensagem('Deu erro');
                }
                
              },
               child:  Text('Salvar')
            )

          ],
        ),
       )  ,
    );
  }
   showMensagem(String msg, {bool error = true} ){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
         content: Text(msg), 
         backgroundColor: error ?  Colors.red : Colors.green
         )
     );
  }
}