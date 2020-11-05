import 'package:flutter/material.dart';
import 'package:my_movies/screens/search.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final myController = TextEditingController();
  String value;

  @override
  void dispose(){
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      backgroundColor: Color(0xff1c262f),
      appBar: AppBar(
          backgroundColor: Color(0xFF1B2C3B),
          title: Text("My Movie"),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, color: Colors.white), onPressed: null)
          ]),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome to my movie database, where you can find all info about your favorite movies here",
              style: TextStyle(color: Colors.white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              autofocus: false,
              controller: myController,
              style: TextStyle(color: Colors.white),
              onChanged: (text){
                value = text;
              },
              decoration: InputDecoration(
                hintText: "Enter movies title Here",
                hintStyle: TextStyle(color: Colors.white24),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  borderSide: BorderSide(width: 1, color: Colors.red),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                  borderSide: BorderSide(width: 1, color: Colors.green),
                ),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(value:value);
                }));
              },
              textColor: Colors.white,
              padding: const EdgeInsets.all(0.0),
              child: Text("Search"),
              color: Colors.green,
            )
          ],
        ),
      ),
    ));
  }
}
