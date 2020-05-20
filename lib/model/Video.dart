class Video {
  String id;
  String titulo;
  String imagem;
  String canal;
  String descricao;

  Video({this.id, this.titulo, this.imagem, this.canal, this.descricao});

//  static converterJson(Map<String, dynamic>json){
//    return Video(
//      //retornando o video baseado nos dados do json
//      id: json["id"]["videoId"],
//      titulo: json["snippet"]["title"],
//      imagem: json["snippet"]["thumbnails"] ["high"]["url"],
//      canal: json["snippet"]["channelId"],
//    );
//  }

  //factory funciona como o static, com o retorno vai ser de um unico objeto
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      //retornando o video baseado nos dados do json
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      imagem: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}
