import 'package:flutter/material.dart';

Widget cardSearch(poster, title, year) {
  return Center(
    child: Container(
      margin: EdgeInsets.all(10),
      child: Card(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              Text(
                title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 15),
              Image.network(
                poster,
                width: 300,
              ),
              SizedBox(height: 10),
              Text('Release date : ' +
                year,
                style: TextStyle(fontSize: 18),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
