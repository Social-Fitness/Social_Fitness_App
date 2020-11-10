import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_fitness_app/utils/custom_clipper.dart';

import 'top_bar.dart';
const _PATH = "assets/image";
const _PIC01 = "$_PATH/Salvatore.jpeg";
const _PIC02 = "$_PATH/Runner.jpg";

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      child: Stack(
        children: <Widget>[
          Container(),
          ClipPath(
            clipper: MyCustomClipper(),
            child: Container(
              height: 700.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(_PIC02),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0,0.9),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
              CircleAvatar( //Set Immagine di prova
              radius: 80.0,
              backgroundImage: AssetImage(_PIC01),
              ),
                  /*new CircleAvatar(
                      radius: 80.0,
                      backgroundColor: const Color(0xFF778899),
                      child: new Image.asset(_PIC01),
                      ),*/
                SizedBox(height: 20.0),
                Text(
                  "Atleta",
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          TopBar(),
        ],
      ),
    );
  }
}