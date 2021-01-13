import 'package:flutter/material.dart';
import 'package:social_fitness_app/screens/home_pt.dart';
import 'package:social_fitness_app/screens/home_sportivo.dart';


class DashBoardSportivo extends StatefulWidget {
  @override
  DashBoardState createState() => DashBoardState();
}

class DashBoardState extends State<DashBoardSportivo> {
  int _currentIndex = 0;

  _onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _screens = [
      HomeScreenSportivo(),
      Center(child: Text("Subscriptions")),
    ];

    return Scaffold(
      body: ListView(
        children: <Widget>[
          HomeScreenSportivo(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Schede In Evidenza',
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
                story('assets/image/pt1.jpg','Pietro Grimaldi'),
                story('assets/image/pt2.jpg','Salvatore Amideo'),
                story('assets/image/pt4.jpg','Ivan Di Pietro'),
                story('assets/image/pt3.jpg','Anna Vanoni'),
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
            ],
          ),
        ],
      ),
    );
  }
}

