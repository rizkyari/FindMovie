import 'package:flutter/material.dart';
import 'package:my_movies/component/bottomNav.dart';
import 'package:my_movies/notifier/favorite_notifier.dart';
import 'package:my_movies/provider/search.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (context) => FavoriteNotifier(),),
    ChangeNotifierProvider<SearchBlock>.value(value: SearchBlock())
  ],
  child: MyApp(),
));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: BottomNav()
    );
  }
}