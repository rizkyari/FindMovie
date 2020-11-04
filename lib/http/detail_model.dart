import 'dart:convert';

import 'package:http/http.dart' as http;


  Future<DetailResult> fetchDetail(String id)async{
    String apiURL = "http://www.omdbapi.com/?apikey=e82f1eb7&i=tt0096895";
    http.Response response = await http.get(apiURL);

    var jsonObject = json.decode(response.body);

    return DetailResult.createDetailResult(jsonObject);
  }

class DetailResult {
  final String title;
  final String year;
  final String rated;
  final String release;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actor;
  final String plot;
  final String language;
  final String poster;
  final String imdbRating;
  final String production;

  DetailResult({this.title, this.year, this.rated, this.release, this.runtime, this.genre, this.director, this.writer, this.actor, this.poster, this.language, this.plot, this.production, this.imdbRating});

  factory DetailResult.createDetailResult(Map<String, dynamic> object){
    return new DetailResult(
      title: object['Title'].toString(),
      year: object['Year'],
      rated: object['Rated'],
      release: object['Released'],
      runtime: object['Runtime'],
      genre: object['Genre'],
      director: object['Director'],
      writer: object['Writer'],
      actor: object['Actors'],
      plot: object['Plot'],
      language: object['Language'],
      poster: object['Poster'],
      imdbRating: object['imdbRating'],
      production: object['Production'],
    );
  }

}