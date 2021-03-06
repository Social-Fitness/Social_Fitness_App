import 'package:flutter/material.dart';
import 'package:social_fitness_app/Bean/Utente.dart';
import 'package:social_fitness_app/PersonalTrainer/Lista_Schede_PT.dart';
import 'package:social_fitness_app/PersonalTrainer/PersonalTrainer_model.dart';


class HomeScreen extends StatelessWidget {
  Utente utente;
  HomeScreen({Key key, this.utente}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListaSchedaPt(listData: personalTrainerData,utente: utente);
  }
}
