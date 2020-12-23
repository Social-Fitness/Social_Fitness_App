import 'package:flutter/material.dart';
import 'package:social_fitness_app/Lista_Schede_PT.dart';
import 'package:social_fitness_app/models/PersonalTrainer_model.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListaSchedaPt(listData: personalTrainerData,);
  }
}
