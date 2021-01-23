import 'package:flutter/material.dart';
import 'package:social_fitness_app/PersonalTrainer/Lista_Schede_PT.dart';
import 'package:social_fitness_app/Sportivo/Sportivo_model.dart';

import 'Lista_Schede_Sportivo.dart';


class HomeScreenSportivo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListaSchedaSportivo(listData: sportivoData,);
  }
}
