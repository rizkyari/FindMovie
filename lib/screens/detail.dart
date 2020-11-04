import 'package:flutter/material.dart';
import 'package:my_movies/http/detail_model.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  DetailResult detailResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Movie'),
      ),
      body: Container(),
    );
  }
}
