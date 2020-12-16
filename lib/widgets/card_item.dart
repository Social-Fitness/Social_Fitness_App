import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  const CardItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 21.0,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.directions_run,
                  size: 40.0,
                  color: Color(0xFFfc6a26),
                ),
              ),
              SizedBox(width: 24.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "Corsa",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Color(0xFFfc6a26),
                    ),
                  ),
                  SizedBox(height: 4.0),
                  Text(
                    "28 Ottobre 2020",
                    style: TextStyle(
                      color: Color(0xFF01579B),
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}