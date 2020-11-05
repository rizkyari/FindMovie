import 'package:flutter/material.dart';
import 'package:my_movies/provider/search.dart';
import 'package:my_movies/screens/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchBlock>.value(
      value: SearchBlock(),
      child: MaterialApp(
        home: Home(),
      ),
    );
  }
}
