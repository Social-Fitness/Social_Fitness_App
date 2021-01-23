class PersonalTrainerModel {
  final String titolo;
  final String salva;
  final String foto;

  PersonalTrainerModel(
      {this.titolo,
        this.foto,
        this.salva});
}

List<PersonalTrainerModel> personalTrainerData = [
  PersonalTrainerModel(
    titolo:  "Allenamento addominali",
    salva: "50M Salvataggi",
    foto:
    "assets/image/Scheda1.jpg",
  ),
  PersonalTrainerModel(
    titolo:  "Allenamento dorsali",
    salva: "917K Salvataggi",
    foto:
    "assets/image/Scheda2.jpg",

  ),
  PersonalTrainerModel(
    titolo:"Allenamento bicipiti",
    salva: "53M Salvataggi",
    foto:
    "assets/image/Scheda6.jpg",

  ),
];
