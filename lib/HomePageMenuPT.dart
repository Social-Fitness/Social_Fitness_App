import 'package:flutter/material.dart';
import 'DashBoard.dart';


class homePagePT extends StatefulWidget {
  @override
  homePageStatePT createState() => homePageStatePT();
}
class homePageStatePT extends State<homePagePT> {
  int _currentIndex = 0;
  final List<Widget> _children = [DashBoard(), DashBoard()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
        ),
        title: Text("HelpYouWorkout"),

        actions: [
          Icon(Icons.add),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child:
        Icon(Icons.search),
      ),
          Icon(Icons.favorite)
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
            color: Color(0xFF01579B),
                size: 30,
        ),
      ),

     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       onTap: (value) {
         // Respond to item press.
         setState(() => _currentIndex = value);
       },
       currentIndex: _currentIndex,
       backgroundColor: Colors.white,
       selectedItemColor: Color(0xFFfc6a26),
       unselectedItemColor: Color(0xFF01579B),
       selectedFontSize: 15,
       unselectedFontSize: 15,
       items: [
         new BottomNavigationBarItem(
             icon: new Icon(Icons.arrow_upward),
           title: new Text("Torna su"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
           title: new Text("Schede"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.add),
           title: new Text("Crea"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.search),
           title: new Text("Cerca"),
         ),
       ],
     ),
    );
  }

}