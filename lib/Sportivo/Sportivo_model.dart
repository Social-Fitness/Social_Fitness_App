class SportivoModel {
  final String title;
  final String thumbNail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;


  SportivoModel(
      {this.title,
        this.thumbNail,
        this.publishedTime,
        this.channelTitle,
        this.channelAvatar,
        this.viewCount,
});
}

List<SportivoModel> sportivoData = [
  SportivoModel(
    title:
    "Allenamento addominali",
    thumbNail:
    "assets/image/Scheda1.jpg",
    publishedTime: "2 settimane fa",
    channelTitle: "Pietro Grimaldi",
    channelAvatar:
    "assets/image/pt1.jpg",
    viewCount: "50M salvataggi",
  ),
  SportivoModel(
    title: "Allenamento dorsali",
    thumbNail:
    "assets/image/Scheda2.jpg",
    publishedTime: "16 ore fa",
    channelTitle: "Salvatore Amideo",
    channelAvatar:
    "assets/image/pt2.jpg",
    viewCount: "917K salvataggi",
  ),
  SportivoModel(
    title: "Allenamento bicipiti",
    thumbNail:
    "assets/image/Scheda6.jpg",
    publishedTime: "6 giorni fa",
    channelTitle: "Anna Vanoni",
    channelAvatar:
    "assets/image/pt3.jpg",
    viewCount: "53M salvataggi",
  ),
];
