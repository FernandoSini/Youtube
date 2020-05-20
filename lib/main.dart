import 'package:flutter/material.dart';
import 'package:youtube/CustomSearchDelegate.dart';
import 'package:youtube/telas/Biblioteca.dart';
import 'package:youtube/telas/EmAlta.dart';
import 'package:youtube/telas/Inicio.dart';
import 'package:youtube/telas/Inscricao.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ),

);


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _indiceAtual = 0;
  String _resultado = "";

  @override
  Widget build(BuildContext context) {

    //enviar o resultado para a classe inicio
    //lista de telas(widgets)s, quando clicar no icone, carregar a pagina/telas
    List<Widget> telas = [
      Inicio(_resultado),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color:Colors.grey,
        ),
        title: Image.asset(
            "images/youtube.png",
          width: 98,
          height: 22,
        ),
        //definindo ações, que são botoões de açoes que vc pode configurar dentro da appBar
        actions: <Widget>[

        /*
        não será mais necessário pois vamos utilizar só a barra de pesquisa, por enquanto
         IconButton(
           icon: Icon(Icons.videocam),
           onPressed: (){
             print("Videocam");
           },
         ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: (){
              print("conta");
            },
          ),*/

          IconButton(
           icon: Icon(Icons.search),
           onPressed: () async {
             //show search exibe a pesquisa
             //ao chamar o search ele vai abri a tela de pesquisa
             //vai fechar usando o close(no build result) e vai pegar o texto
                String res = await showSearch(
                 context: context,
                 delegate: CustomSearchDelegate());
                setState(() {
                  _resultado = res;
                });
                 print("resultado digitado" + res);
           },
         ),

        ],
      ),
      body:Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
        //o fixed color vai substituir a cor do icone
          fixedColor: Colors.red ,
          currentIndex: _indiceAtual,
          onTap: (indice){
            setState(() {
              _indiceAtual = indice;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
           //   backgroundColor: Colors.orange,
                icon:Icon(Icons.home),
                title: Text("Início")
            ),
            BottomNavigationBarItem(
          //    backgroundColor: Colors.red,
                icon: Icon(Icons.whatshot),
                title: Text("Em alta")
            ),
            BottomNavigationBarItem(
           //   backgroundColor: Colors.blue,
                icon: Icon(Icons.subscriptions),
                title: Text("Inscricoes")
            ),
            BottomNavigationBarItem(
            //  backgroundColor: Colors.green,
                icon: Icon(Icons.folder),
                title: Text("Biblioteca")
            ),
           ],
      ),
    );
  }
}

