import 'package:flutter/material.dart';
import 'package:youtube/Api.dart';
import 'package:youtube/model/Video.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

class Inicio extends StatefulWidget {
  //recebendo os resultados da classe main
  String pesquisa;

  Inicio(this.pesquisa);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa); //retornando a listagem de videos
  }

  @override
  void initState() {
        super.initState();
        print(" 1- init state"); //é o primeiro metodo quando a stateful widget é carregada
  }

  @override
  void didChangeDependencies() {
        super.didChangeDependencies();
        print("2 did change dependencies"); //segundo metodo chamado
  }

  @override
  void didUpdateWidget(Inicio oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("2- didupdate widget chamado"); //é chamado em outro contexto
  }

  @override
  void dispose() {
    super.dispose(); //chamado para o descarte de itens que vc não quer usar mais, quer dizer que a classe não está sendo mais utilizada
    print("4- dispose chamado"); //executado por ultimo
  }

  @override
  Widget build(BuildContext context) {
    print(" 3- build chamado"); //chamado em terceiro
    return FutureBuilder<List<Video>>(
      future: _listarVideos(widget.pesquisa),
      //metodo que vai retornar os videos
      // ignore: missing_return
      builder: (context, snapshot) {
        print("1234 snap" + snapshot.toString());
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(
              child: CircularProgressIndicator(),
            );
            break;
          case ConnectionState.active:
          case ConnectionState.done:
            print("Teste 1234 " + snapshot.toString());
            if (snapshot.hasData) {
              //define um separador entre os videos(items)
              return ListView.separated(
                  itemBuilder: (context, index) {
                    //recuperando a lista de videos
                    List<Video> videos = snapshot.data;
                    Video video = videos[index];
                    return GestureDetector(
                      onTap: () {
                        //Classe que será usada para executar o vídeo
                        FlutterYoutube.playYoutubeVideoById(
                            apiKey: CHAVE_YOUTUBE_API,
                            videoId: video.id,
                            autoPlay: true,
                            fullScreen: true);
                      },
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                //define como a imagem vai ficar dentro do container
                                image: NetworkImage(video
                                    .imagem), //network image carrega imagens de uma url
                              ),
                            ),
                          ),
                          ListTile(
                            title: Text(video.titulo),
                            subtitle: Text(video.canal),
                          ),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => Divider(
                        height: 3,
                       // color: Colors.red,
                      ),
                  itemCount: snapshot.data.length);
            } else {
              return Center(
                child: Text("Nenhum dado a ser exibido"),
              );
            }
            break;
        }
      },
    );
  }
}
