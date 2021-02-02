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
    titolo:  "Allenamento Sterrato",
    salva: "50M Salvataggi",
    foto:
    "assets/image/Scheda1.jpg",
  ),
  PersonalTrainerModel(
    titolo:  "Allenamento Per Competizione",
    salva: "917K Salvataggi",
    foto:
    "assets/image/fotoHome2.jpeg",

  ),
  PersonalTrainerModel(
    titolo:"Allenamento Maratona",
    salva: "53M Salvataggi",
    foto:
    "assets/image/fotoHome3.jpeg",

  ),
];
