import 'package:flutter/material.dart';
import 'package:my_movies/http/post_model.dart';
import 'package:my_movies/screens/detail.dart';

class Detail extends StatefulWidget {

  String value;
  Detail({Key key,@required this.value}) : super(key: key);

  @override
  _DetailState createState() => _DetailState(value);
}

class _DetailState extends State<Detail> {

  String value;
  _DetailState(this.value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Detail"),
        ),
        body: FutureBuilder(
          future: fetchPosts(value),
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
            if (snapshot.hasData) {
              List<Post> posts = snapshot.data;
              return new ListView(
                  children: posts
                      .map((post) => Card(
                        child: InkWell(
                          splashColor: Colors.green,
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return DetailScreen();
                            }));
                          },
                          child: Container(
                            width: 300,
                            height: 500,
                            child: Column(children: <Widget>[
                          Image(image: NetworkImage(post.poster)),
                          Text(post.title),
                          Text(post.year),
                        ],),
                          ),
                        )
                      ))
                      .toList());
            } else if (snapshot.hasError) {
              return snapshot.error;
            }
          },
        ));
  }
}
