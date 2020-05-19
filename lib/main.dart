import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {

    //lista de telas(widgets)s, quando clicar no icone, carregar a pagina/telas
    List<Widget> telas = [
      Inicio() ,
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
         IconButton(
           icon: Icon(Icons.videocam),
           onPressed: (){
             print("Videocam");
           },
         ),
          IconButton(
           icon: Icon(Icons.search),
           onPressed: (){
             print("Pesquisa");
           },
         ),
          IconButton(
           icon: Icon(Icons.account_circle),
           onPressed: (){
             print("conta");
           },
         ),
        ],
      ),
      body:telas[_indiceAtual],
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

