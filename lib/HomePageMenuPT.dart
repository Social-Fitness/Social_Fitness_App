import 'package:flutter/material.dart';
import 'package:social_fitness_app/DashBoardPT.dart';
import 'DashBoardSportivo.dart';


class homePagePT extends StatefulWidget {
  @override
  homePageStatePT createState() => homePageStatePT();
}
class homePageStatePT extends State<homePagePT> {
  int _currentIndex = 0;
  final List<Widget> _children = [DashBoardPT(), DashBoardPT()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:Icon(Icons.menu),
          onPressed: () { Route route = MaterialPageRoute(
              builder: (context) => _myDrawerWithHeaderAndDivider(context) );
          Navigator.push(context, route); },
        ),
        title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26) ), ),

        actions: [
          IconButton(icon:Icon(Icons.add)),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child:
        IconButton(icon:Icon(Icons.search)),
      ),
          IconButton(icon:Icon(Icons.favorite))
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
       backgroundColor: Colors.black12,
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

  Widget _myDrawerWithHeaderAndDivider(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Profilo'),
            decoration: BoxDecoration(
              color: Color(0xFFfc6a26),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Nome e Cognome'),
            onTap: () {
              print('Nome e Cognome');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text('Data Di Nascita'),
            onTap: () {
              print('Data Di Nascita');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Cellulare'),
            onTap: () {
              print('Cellulare');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('E-mail'),
            onTap: () {
              print('E-mail');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.lock),
            title: Text('Cambia la Password'),
            onTap: () {
              print('Closed!');
            },
          ),
          Divider(),
          ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () {
              print('Logout');
            },
          ),
        ],
      ),
    );
  }
}