import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_fitness_app/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]) // Questo metodo non fa ruotare il dispositivo
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  //In questa classe definisco il widget root dell'applicazione
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Fitness',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Montserrat",
          hintColor: Color(0xFF0288D1),
          primaryColor: Color(0xFF01579B),
          canvasColor: Colors.transparent),
      home: Home(),
    );
  }
}
