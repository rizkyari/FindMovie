class Post {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
  final String plot;
  final String rated;
  final String release;
  final String runtime;
  final String genre;
  final String director;
  final String writer;
  final String actor;
  final String language;
  final String imdbRating;
  final String production;

  Post({
    this.title,
    this.year,
    this.imdbId,
    this.type,
    this.poster,
    this.plot,
    this.rated,
    this.release,
    this.runtime,
    this.genre,
    this.director,
    this.writer,
    this.actor,
    this.language, 
    this.production, 
    this.imdbRating
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return new Post(
      title: json['Title'].toString(),
      year: json['Year'].toString(),
      imdbId: json['imdbID'].toString(),
      type: json['Type'].toString(),
      poster: json['Poster'].toString(),
      plot: json['Plot'].toString(),
      rated: json['Rated'].toString(),
      release: json['Released'].toString(),
      runtime: json['Runtime'].toString(),
      genre: json['Genre'].toString(),
      director: json['Director'].toString(),
      writer: json['Writer'].toString(),
      actor: json['Actors'].toString(),
      language: json['Language'].toString(),
      imdbRating: json['imdbRating'].toString(),
      production: json['Production'].toString(),
    );
  }
}
