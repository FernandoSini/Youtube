import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/Video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBco4lD-dyANAnW4_NgveSg0pZC3VsSqkY";
const ID_CANAL = "UC7k2B_XMew_FmxDV4LXiI6Q";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  //os resultados serão recuperados no futuro
  // ignore: missing_return
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            // "&channelId=$ID_CANAL"
            "&q=$pesquisa");
    print("teste212312" +response.statusCode.toString());
    print("teste212312" +response.body.toString());
    //testando se o response deu certo
    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      //map vai percorrer cada um dos items, são processados e convertidos em videos
      List<Video> videos = dadosJson["items"].map<Video>(
          //percorrer os vídeos
          (map) {
        return Video.fromJson(map);
        //return Video.converterJson(json);
      }).toList();

      return videos;
//      for(var video in videos){
//        print("resultado: " +video.titulo);
//      }

//      for( var video in dadosJson["items"]){
//        print("Resultado: " + video.toString());
//      }
//     // print("resultado: " +dadosJson["items"].toString());

    } else {}
  }
}
