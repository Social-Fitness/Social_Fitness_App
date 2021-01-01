import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_fitness_app/screens/home_pt.dart';


class DashBoardPT extends StatefulWidget {
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoardPT> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomeScreen(),
      Center(child: Text("Subscriptions")),
    ];

    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeScreen(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Le Schede Più Amate',
                  style: TextStyle(
                      color: Colors.black.withOpacity(.8),
                      fontWeight: FontWeight.w600,
                      fontSize: 19),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: <Widget>[
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 15),
            height: 250,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                story('assets/image/Scheda1.jpg','260'),
                story('assets/image/Scheda2.jpg','220'),
                story('assets/image/Scheda3.jpg','180'),
                story('assets/image/Scheda4.jpg','100'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget story(String image,name) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(1),
            width: 176,
            height: 200,
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                border: Border.all(color: Color(0xFF01579B),width: 2)
            ),
            child: ClipRect(
              child: Image.asset(image,fit: BoxFit.cover,),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
          Text(
            name,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF01579B),
            ),
          ),
          Icon(
            Icons.favorite,
            color: Color(0xFF01579B),
          )
    ],
          ),
        ],
      ),
    );
  }

}