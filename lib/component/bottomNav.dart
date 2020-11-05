import 'package:flutter/material.dart';
import 'package:my_movies/screens/favorite.dart';
import 'package:my_movies/screens/home.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    Home(),
    ListFavorite(),
  ];
  
  void _onItemTap(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _widgetOptions.elementAt((_selectedIndex)),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTap,
        selectedFontSize: 13,
        unselectedFontSize: 10,
      ),
    );
  }
}