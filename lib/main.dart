import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widgets_Comuni/WelcomePage.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              title: 'HelpYourWorkout',
              debugShowCheckedModeBanner: false,
              /*theme: ThemeData
                  fontFamily: "Montserrat",
                  hintColor: Color(0xFFfc6a26),
                  primaryColor: Color(0xFF01579B),
                  canvasColor: Colors.transparent),*/
              home: WelcomePage(),
            );
          }
        }


        /* FirebaseFirestore.instance
                  .collection("users")
                  .where("Cognome", isEqualTo : "Nardi")
                  .get().then((value){
                value.docs.forEach((element) {
                  FirebaseFirestore.instance.collection("users").doc(element.id).delete().then((value){
                    print("Success!");
                  });
                });
              });*/