import 'package:flutter/material.dart';
import 'package:my_movies/notifier/favorite_notifier.dart';
import 'package:my_movies/provider/search.dart';
import 'package:provider/provider.dart';
import 'package:my_movies/screens/detail.dart';

class ListFavorite extends StatefulWidget {
  @override
  _ListFavoriteState createState() => _ListFavoriteState();
}

class _ListFavoriteState extends State<ListFavorite> {
  @override
  Widget build(BuildContext context) {
    FavoriteNotifier favoriteNotifier = Provider.of<FavoriteNotifier>(context);
    final SearchBlock searchBlock = Provider.of<SearchBlock>(context);
    return Scaffold(
      appBar: AppBar(
          title: Text('My Favorite Movie'), backgroundColor: Color(0xFF1B2C3B)),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Container(
              height: 500,
              child: ListView.builder(
                itemBuilder: (BuildContext context, int index) => Card(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Text(
                          favoriteNotifier.favoriteList[index].title,
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        Text(favoriteNotifier.favoriteList[index].year),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              child: Text('Detail Movie',
                                  style: TextStyle(color: Colors.white)),
                              splashColor: Colors.lightBlue[200],
                              color: Colors.blue[400],
                              onPressed: () {
                                setState(() {
                                  print(favoriteNotifier
                                      .favoriteList[index].imdbId);
                                  searchBlock.idPost = favoriteNotifier.favoriteList[index].imdbId;    
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
                                              favoriteNotifier.favoriteList[index].imdbId)));
                                });
                              },
                            ),
                            RaisedButton(
                              child: Text(
                                'Remove',
                                style: TextStyle(color: Colors.white),
                              ),
                              color: Colors.redAccent[700],
                              splashColor: Colors.red[300],
                              onPressed: () {
                                setState(() {
                                  favoriteNotifier.removeFavorite(
                                      favoriteNotifier
                                          .favoriteList[index].imdbId);
                                });
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                itemCount: favoriteNotifier.favoriteList.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
