import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';


class Activity_pt extends StatefulWidget {
  @override
  _Activity_pt createState() => _Activity_pt();
}

class _Activity_pt extends State<Activity_pt> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int _selectedIndex=2;
  TextEditingController _nameController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    Color primary = Theme.of(context).primaryColor;
    void initState() {
      super.initState();
    }
    void _onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }
    //funzioni di login e registrazione



    //input widget
    Widget _input(Icon icon, String hint, TextEditingController controller,
        bool obsecure) {
      return Container(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: TextField(
          controller: controller,
          obscureText: obsecure,
          style: TextStyle(
            fontSize: 20,
          ),
          decoration: InputDecoration(
              hintStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              hintText: hint,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 2,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: 3,
                ),
              ),
              prefixIcon: Padding(
                child: IconTheme(
                  data: IconThemeData(color: Theme.of(context).primaryColor),
                  child: icon,
                ),
                padding: EdgeInsets.only(left: 30, right: 10),
              )),
        ),
      );
    }

    //button widget
    Widget _button(String text, Color splashColor, Color highlightColor,
        Color fillColor, Color textColor, void function()) {
      return RaisedButton(
        highlightElevation: 0.0,
        splashColor: splashColor,
        highlightColor: highlightColor,
        elevation: 0.0,
        color: fillColor,
        shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.bold, color: textColor, fontSize: 20),
        ),
        onPressed: () {
          function();
        },
      );
    }

    void _crea() {
      //crea nuova attività
    }

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      key: _scaffoldKey,
      backgroundColor: Theme.of(context).primaryColor,
      body: DecoratedBox(
        decoration: BoxDecoration(color: Theme.of(context).canvasColor),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0)),
          child: Container(
            child: ListView(
              children: <Widget>[

                SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 210,
                      child: Stack(
                        children: <Widget>[

                          Positioned(
                            child: Container(
                              padding: EdgeInsets.only(bottom: 10, right: 70, left: 80),
                              alignment: Alignment.center,
                              child: Text(
                                  "PIANIFICA UNA NUOVA ATTIVITA'",
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF0288D1),

                                  )
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                        top: 10,
                      ),
                      child: _input(Icon(Icons.accessibility),
                          "NOME ATTIVITA'", _nameController, false),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(Icon(Icons.calendar_today),
                          "DATA", _nameController, false), //Creare funzione di controllo
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(Icon(Icons.watch_later_outlined),
                          "ORA DI INIZIO", _nameController, false),//Creare funzione di controllo
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(Icon(Icons.watch_later_outlined),
                          "ORA DI FINE", _nameController, false),//Creare funzione di controllo
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(Icon(Icons.location_city),
                          "CITTA", _nameController, false),//Creare funzione di controllo
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 20,
                      ),
                      child: _input(Icon(Icons.add_location_alt),
                          "INDIRIZZO", _nameController, false),//Creare funzione di controllo
                    ),

                    Padding(
                      padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Container(
                        child: _button("CREA", Colors.white, primary,
                            primary, Colors.white, _crea),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ]),
                ),
              ],
            ),
            height: MediaQuery.of(context).size.height / 0.0,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profilo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.watch),
            label: 'Pianifica attività',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF0288D1),
        onTap: _onItemTapped,
      ),
    );
  }
}