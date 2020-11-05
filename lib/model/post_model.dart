// import 'dart:convert';

// import 'package:http/http.dart' as http;

// Future<List<Post>> fetchPosts(String text) async {
//   http.Response response = await http.get(
//       'http://www.omdbapi.com/?apikey=e82f1eb7&s=$text');
//   var responseJson = json.decode(response.body);
//   return (responseJson['Search'] as List)
//       .map((p) => Post.fromJson(p))
//       .toList();
// }

class Post {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
  final String plot;

  Post({this.title, this.year, this.imdbId, this.type, this.poster, this.plot});

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      title: json['Title'].toString(),
      year: json['Year'].toString(),
      imdbId: json['imdbID'].toString(),
      type: json['Type'].toString(),
      poster: json['Poster'].toString(),
      plot: json['Plot'].toString(),
    );
  }
}