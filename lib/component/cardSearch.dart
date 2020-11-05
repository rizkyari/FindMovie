import 'package:flutter/material.dart';

Widget cardSearch(poster, title, year) {
  return Center(
    child: Card(
      child: Container(
        width: 350,
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.network(
              poster,
              width: 300,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 18,),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              year,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      ),
    ),
  );
}
