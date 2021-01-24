import 'package:flutter/material.dart';


class SchedePublic extends StatefulWidget {
  @override
  SchedePublicState createState() => SchedePublicState();
}

class SchedePublicState extends State<SchedePublic> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      primary: true,
      crossAxisSpacing: 0,
      mainAxisSpacing: 0,
      shrinkWrap: true,
      children: <Widget>[
        _buildcard('Total Body', '2021-01-10','30','assets/image/Scheda1.jpg'),
        _buildcard('Atletica', '2021-01-10','60','assets/image/Scheda2.jpg'),
        _buildcard('Total Body', '2021-01-11','100','assets/image/Scheda6.jpg'),
        _buildcard('Addome', '2021-01-12','101','assets/image/Scheda7.jpg'),


      ],
    );
  }
  _buildcard(String nome_scheda, String date , String rate , String imgpath)
  {
    return Container(
      height: 150,
      width: 150,

      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 3.0,
              spreadRadius: 3.0,
              color: Colors.white.withOpacity(0.5),
            )
          ]
      ),
      child: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 100,
                width: 170,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/image/Scheda7.jpg'),
                      fit: BoxFit.cover

                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(nome_scheda, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFFfc6a26)),),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(date, style: TextStyle(fontSize: 15, color: Colors.grey),)
                ],
              )
            ],
          )

        ],
      ),
    );
  }
}