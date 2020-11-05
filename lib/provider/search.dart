import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:my_movies/model/post_model.dart';

class SearchBlock extends ChangeNotifier {
  List<Post> _post;
  List<Post> get listpost => _post;
  set listpost(List<Post> val) {
    _post = val;
    notifyListeners();
  }

  Post _detail;
  Post get detailpost => _detail;

  set detailpost(Post val){
    _detail=val;
    notifyListeners();
  }

  String _id;
  String get idPost => _id;
  set idPost(String val){
    _id=val;
    notifyListeners();
  }

  Future<List<Post>> fetchPost(String text) async {
    final response =
        await http.get('http://www.omdbapi.com/?apikey=e82f1eb7&s=$text');

    var res = jsonDecode(response.body);
    // return (res['Search'] as List)
    //   .map((p) => Post.fromJson(p))
    //   .toList();
    List<Post> data = [];

    for (var i = 0; i < res['Search'].length; i++) {
      var post = Post.fromJson(res['Search'][i]);
      data.add(post);
    }

    listpost = data;
    return listpost;
  }

  Future<Post> getDetail() async{
    final response = await http.get('http://www.omdbapi.com/?apikey=e82f1eb7&i=$_id');
    detailpost=Post.fromJson(jsonDecode(response.body));
    return detailpost;
  }
}
