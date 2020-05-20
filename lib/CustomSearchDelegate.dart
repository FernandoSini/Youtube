//Search delegate é a classe que sera usada para fazer as pesquisas
import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  // search delegate delega uma função para customsearch, ela fica obrigada a usar metodos para customizar pesquisa
  //ou seja, delega que a classe use esses metodos
  // cada metodo é responsavel por construir a estrutura na pesquisa
  @override
  List<Widget> buildActions(BuildContext context) {
    //cria as açoes na pesquisa

    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          //o query acessa o valor que está sendo digitado na barra de pesquisas
          //a query tem que receber o que ele vai digitar
          //nesse caso query="" ele limpa a barra de pesquisas
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    //cria as acoes de voltar

    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        //configurando ações para voltar, e exibir a tela que está abaixo dela
        //o result será capturado pelo showSearch(retorna o resultado)
        //no segundo parametro configurando o valor para ser retornado
        close(context, "");
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //constroi os resultados que foram pesquisados, quando o usuário faz a pesquisa
    //print("resultado: pesquisa realizada");
    //ao confirmar a pesquisa vamos fechar a tela passando a query
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    //define sugestões de pesquisas baseado no que ele digita
    // print("resultado digitado: " +query);

    List<String> lista = List();
    if (query.isNotEmpty) {
      //caso essa query não esteja vazia
      lista = [
        "gta",
        "zombies",
        "cod",
        "gartic",
      ].where((texto) => texto.toLowerCase().startsWith(query.toLowerCase())
      ).toList(); //filtrando as pesquisas

      return ListView.builder(
          itemCount: lista.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: (){
                close(context, lista[index]);
              },
              title: Text(lista[index]),
            );
          });
    } else {
      return Center(
        child: Text("Nenhum resultado para pesquisa"),
      );
    }

  }
}
