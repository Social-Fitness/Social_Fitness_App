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
    titolo: "Workout 1",
    salva: "50M Salvataggi",
    foto:
    "assets/image/Scheda1.jpg",
  ),
  PersonalTrainerModel(
    titolo: "Workout 2",
    salva: "917K Salvataggi",
    foto:
    "assets/image/Scheda2.jpg",

  ),
  PersonalTrainerModel(
    titolo: "Workout 3",
    salva: "53M Salvataggi",
    foto:
    "assets/image/Scheda3.jpg",

  ),
];
