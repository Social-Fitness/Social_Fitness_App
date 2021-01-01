class SportivoModel {
  final String title;
  final String description;
  final String thumbNail;
  final String publishedTime;
  final String channelTitle;
  final String channelAvatar;
  final String viewCount;
  final String likeCount;
  final String dislikeCount;

  SportivoModel(
      {this.title,
        this.description,
        this.thumbNail,
        this.publishedTime,
        this.channelTitle,
        this.channelAvatar,
        this.viewCount,
        this.likeCount,
        this.dislikeCount});
}

List<SportivoModel> sportivoData = [
  SportivoModel(
    title: "Workout 1",
    description:
    "Allenamento addominali",
    thumbNail:
    "assets/image/Scheda1.jpg",
    publishedTime: "2 settimane fa",
    channelTitle: "Pietro Grimaldi",
    channelAvatar:
    "assets/image/logo_prova.png",
    viewCount: "50M visualizzazioni",
    likeCount: "34K",
    dislikeCount: "2K",
  ),
  SportivoModel(
    title: "Workout 2",
    description: "Allenamento dorsali",
    thumbNail:
    "assets/image/Scheda2.jpg",
    publishedTime: "16 ore fa",
    channelTitle: "Edoardo Attanasio",
    channelAvatar:
    "assets/image/logo_prova.png",
    viewCount: "917K visualizzazioni",
    likeCount: "20k",
    dislikeCount: "51",
  ),
  SportivoModel(
    title: "Workout 3",
    description: "Allenamento bicipiti",
    thumbNail:
    "assets/image/Scheda3.jpg",
    publishedTime: "6 giorni fa",
    channelTitle: "Carmine Seccia",
    channelAvatar:
    "assets/image/logo_prova.png",
    viewCount: "53M visualizzazioni",
    likeCount: "20k",
    dislikeCount: "51",
  ),
];
