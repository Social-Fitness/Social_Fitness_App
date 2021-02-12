class SportivoModel {
  final String title;
  final String thumbNail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;
  final String contenuto;


  SportivoModel(
      {this.title,
        this.thumbNail,
        this.publishedTime,
        this.channelTitle,
        this.channelAvatar,
        this.viewCount,
        this.contenuto
});
}

List<SportivoModel> sportivoData = [
  SportivoModel(
    title:
    "Allenamento sterrato",
    thumbNail:
    "assets/image/Scheda1.jpg",
    publishedTime: "2 settimane fa",
    channelTitle: "Pietro Nardi",
    channelAvatar:
    "assets/image/pt1.jpg",
    viewCount: "50M salvataggi",
    contenuto: "Dettagli: BPM:120, Velocita:15km/h, Pendenza: 10%, Disponibilita:2Giorni, Obiettivo:30KM"
  ),
  SportivoModel(
    title: "Allenamento 2.0",
    thumbNail:
    "assets/image/Scheda2.jpg",
    publishedTime: "16 ore fa",
    channelTitle: "Salvatore Amideo",
    channelAvatar:
    "assets/image/pt2.jpg",
    viewCount: "917K salvataggi",
      contenuto: "Dettagli: BPM:80, Velocita:11km/h, Pendenza: 5%, Disponibilita:5Giorni, Obiettivo:10KM"
  ),
  SportivoModel(
    title: "Allenamento 800m",
    thumbNail:
    "assets/image/Scheda6.jpg",
    publishedTime: "6 giorni fa",
    channelTitle: "Anna Vanoni",
    channelAvatar:
    "assets/image/pt3.jpg",
    viewCount: "53M salvataggi",
      contenuto: "Dettagli: BPM:75, Velocita:9km/h, Pendenza: 2%, Disponibilita:4Giorni, Obiettivo:20KM"
  ),
];
