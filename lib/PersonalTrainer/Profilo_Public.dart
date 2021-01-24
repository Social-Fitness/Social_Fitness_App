import 'package:flutter/material.dart';
import 'package:social_fitness_app/PersonalTrainer/SchedePublic.dart';

class PublicProfilePage extends StatefulWidget {


  @override
  PublicProfilePageState createState() => PublicProfilePageState();
}

class PublicProfilePageState extends State<PublicProfilePage> with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController =TabController(length: 2, vsync: this);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Profilo Personal Trainer', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w200),),
          leading: IconButton(icon: Icon(Icons.arrow_back_ios, color: Colors.black,), onPressed: (){}),
        ),
        body: ListView(

          children: <Widget>[
            Container(
              color: Colors.white,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            image: DecorationImage(image: AssetImage('assets/image/profile.png'),
                                fit: BoxFit.cover

                            )
                        ),
                      ),
                    ),

                  ),

                ],
              ),
            ),
            Container(
              color: Colors.white,
              child: Column(

                children: <Widget>[
                  SizedBox(height: 20),
                  Text('Salvatore Amideo',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color(0xFF01579B),
                    ),
                  ),
                  SizedBox(height: 10,child: Container(
                    color: Colors.white,
                  ),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.location_on, size: 17,),
                      Text('Calabria - Italy',
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black.withOpacity(0.6)
                        ),)

                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,child: Container(
              color: Colors.white,
            ),),
            Container(
              color: Colors.white,
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(25, 10, 25, 10),
                    height: 70,
                    width: double.infinity,
                    padding: EdgeInsets.only(top: 15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFFfc6a26),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10.0,
                            spreadRadius: 2,
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Text('112 k',
                              style: TextStyle(fontSize: 14, color: Colors.black),),
                            SizedBox(height: 5,),
                            Text('Followers', style: TextStyle( fontSize: 14, color: Colors.black.withOpacity(0.5)),)
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text('1500',
                              style: TextStyle(fontSize: 14, color: Colors.black),),
                            SizedBox(height: 5,),
                            Text('Schede', style: TextStyle( fontSize: 14, color: Colors.black.withOpacity(0.5)),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  _buildRichiediSchedaBtn(),
                  _buildSeguiBtn(),
                ],
              ),
            ),
            SizedBox(height: 5,),
            SizedBox(height: 20,child: Container(
              color: Color(0xFF01579B).withOpacity(0.2),
            ),),
            Container(
              color: Colors.white,
              child: TabBar(
                controller: tabController,
                indicatorColor: Colors.transparent,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xFFfc6a26).withOpacity(0.5),
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text('Pagina 1', style: TextStyle(fontSize: 20),),
                  ),
                  Tab(
                    child: Text('Pagine 2', style: TextStyle(fontSize: 20),),

                  )
                ],
              ),
            ),
            SizedBox(height: 10,),
            Container(
              height: MediaQuery.of(context).size.height -450.0,
              child: TabBarView(
                controller: tabController,
                children: <Widget>[
                  new SchedePublic(),
                  new SchedePublic(),
                ],
              ),
            ),

          ],
        )
    );
  }

  Widget _buildRichiediSchedaBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF01579B) ,
        child: Text(
          'Richiedi Scheda',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }

  Widget _buildSeguiBtn() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Color(0xFF01579B) ,
        child: Text(
          'Segui',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 15.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ),
    );
  }
}