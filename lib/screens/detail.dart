
import 'package:flutter/material.dart';
import 'package:my_movies/model/favorite_model.dart';
import 'package:my_movies/model/post_model.dart';
import 'package:my_movies/notifier/favorite_notifier.dart';
import 'package:my_movies/provider/search.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  final String id;
  DetailScreen(this.id);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final SearchBlock searchblock = Provider.of<SearchBlock>(context);
    searchblock.getDetail();

    Post post = searchblock.detailpost;

    FavoriteNotifier favoriteNotifier = Provider.of<FavoriteNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        title: post != null ? Text(post.title) : Text(''),
        backgroundColor: Color(0xFF1B2C3B),
      ),
      body: post != null
          ? Builder(builder: (context) {
              return SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          post.title,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: () {
                          SnackBar text = SnackBar(
                            content: Text(post.title +
                                " is added to your favorite lisst"),
                          );
                          Scaffold.of(context).showSnackBar(text);
                          setState(() {
                            favoriteNotifier.addFavorite(Favorite(post.title,
                                post.poster, post.year, post.imdbId));
                          });
                        },
                        icon: Icon(Icons.favorite),
                        label: Text('Add to my favorite'),
                        color: Colors.pink,
                        textColor: Colors.white,
                        splashColor: Colors.red,
                      ),
                      (post.poster != 'N/A'
                          ? Image.network(post.poster)
                          : Text('no image available')),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Release date : ' + post.year,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Plot',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        post.plot,
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("${post.runtime} | ${post.rated}"),
                          Text(post.runtime + ' | '),
                          Text(post.rated + ' | '),
                          Text(post.language + ' | ',textAlign: TextAlign.center,),
                          Text('IMDB Rating : ' + post.imdbRating),
                        ],
                      ),
                      SizedBox(height: 10),
                      Text('Directors : ' + post.director,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center),
                      Text('Actors' + post.actor,
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ),
              );
            })
          : Center(child: CircularProgressIndicator()),
    );
  }
}
