import 'package:flutter/material.dart';
import 'package:my_movies/model/post_model.dart';
import 'package:my_movies/provider/search.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  final String id;
  DetailScreen(this.id);

  @override
  Widget build(BuildContext context) {
    final SearchBlock searchblock = Provider.of<SearchBlock>(context);
    searchblock.getDetail();

    Post post = searchblock.detailpost;

    return Scaffold(
      appBar: AppBar(
        title: post != null ? Text(post.title) : Text(''),
      ),
      body: post != null
          ? SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      post.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  RaisedButton.icon(
                      onPressed: () => print('clicked'),
                      icon: Icon(Icons.favorite),
                      label: Text('Add to my favorite'),
                      color: Colors.pink,
                      textColor: Colors.white,
                      splashColor: Colors.red,
                  ),
                  Image.network(post.poster),
                  Text(
                    post.year,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(post.plot, style: TextStyle(fontSize: 18), textAlign: TextAlign.center,),
                ],
              ),
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
