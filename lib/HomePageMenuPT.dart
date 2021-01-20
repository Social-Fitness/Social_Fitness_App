import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:social_fitness_app/CambioPW.dart';
import 'package:social_fitness_app/Login_Page.dart';
import 'package:social_fitness_app/widgets/Richiesta_schede.dart';
import 'package:social_fitness_app/widgets/Search_Bar.dart';
import 'DashBoardPT.dart';
import 'allenamento_ciclismo.dart';
import 'allenamento_corsa.dart';
import 'widgets/Search.dart';


class homePagePT extends StatefulWidget {
  @override
  homePageStatePT createState() => homePageStatePT();
}
class homePageStatePT extends State<homePagePT> {
  int _currentIndex = 0;
  final List<Widget> _children = [ DashBoardPT(), null,RichiestaSchedePage(), SearchBar()];
  final String _collection = 'users';
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;
  String nome = "";
  String cognome = "";
  String email = "";
  String cellulare="";
  String dataNascita="";


  void messagesStream() async {
    await for (var snapshot in _fireStore.collection(_collection).snapshots()) {
      for (var message in snapshot.docs) {
        //print(message.data());
        if(message["Email"] == "salvatore@gmail.com"){
            nome = message["Nome"];
            cognome = message["Cognome"];
            email = message["Email"];
            cellulare=message["Cellulare"];
            dataNascita=message["Data_Di_Nascita "];
            }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    messagesStream();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0xFF01579B),
          size: 30,
        ),
        leading: IconButton(
          icon:Icon(Icons.menu),
          onPressed: () {
            messagesStream();
            Route route = MaterialPageRoute(
                builder: (context) => _myDrawerWithHeaderAndDivider(context) );
            Navigator.push(context, route); },
        ),
        title: Text("HelpYourWorkout",  style: TextStyle(fontSize: 14, color: Color(0xFFfc6a26))),
        actions: <Widget>[

          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              List<String> example=["uno", "due","tre"];
              showSearch(context: context, delegate: Search(example));
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
                _showPopupMenu();
            },
          ),
        ],
      ),
     body: _children[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
       type: BottomNavigationBarType.fixed,
       onTap: (value) {
         // Respond to item press.
         setState(() => _currentIndex = value);
       },
       currentIndex: _currentIndex,
       selectedItemColor: Color(0xFFfc6a26),
       unselectedItemColor: Color(0xFF01579B),
       selectedFontSize: 15,
       unselectedFontSize: 15,
       items: [
         new BottomNavigationBarItem(
           icon: new Icon(Icons.home),
           title: new Text("Home"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
           title: new Text("Schede"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.add_alert),
           title: new Text("Richieste"),
         ),
         new BottomNavigationBarItem(
           icon: new Icon(Icons.search),
           title: new Text("Cerca"),

         ),
       ],
     ),
    );
  }

_showPopupMenu() {
  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(25.0, 25.0, 0.0, 0.0),
    color: Colors.white,
    items: [
      PopupMenuItem<String>(
          child: const Text('Visualizza In Ordine Crescente'), value: '1', textStyle: TextStyle(fontSize: 14, color: Color(0xFF01579B))),
      PopupMenuItem<String>(
          child: const Text('Visualizza In Ordine Decrescente'), value: '2', textStyle: TextStyle(fontSize: 14, color: Color(0xFF01579B))),
    ],
    elevation: 8.0,
  )
      .then<void>((String itemSelected) {
    if (itemSelected == null) return;

    if (itemSelected == "1") {
      //code here
    } else if (itemSelected == "2") {
      //code here
    }
  });
}


  Widget _myDrawerWithHeaderAndDivider(BuildContext context) {
    return Container(
        child: Drawer(// your specified height
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
            DrawerHeader(
              child: Text('PROFILO',  style: TextStyle(fontSize: 40, color: Colors.white,),
                textAlign: TextAlign.center,),
              decoration: BoxDecoration(
                color: Color(0xFFfc6a26),
              ),
          ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text(nome),
            ),
            Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text(cognome),
              ),
              Divider(),
            ListTile(
              leading: Icon(Icons.calendar_today),
              title: Text(dataNascita),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text(cellulare),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text(email),
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.lock),
              title: Text('Cambia la Password'),
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => CambioPW());
                Navigator.push(context, route);
              },
            ),
            Divider(),
            ListTile(
              trailing: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                Route route = MaterialPageRoute(
                    builder: (context) => LoginScreen());
                Navigator.push(context, route);
              },
            ),
          ],
        ),
        ),
    );
  }
}