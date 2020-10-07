class MovieDetails {
  List<Genres> genres;
  int id;
  String overview;
  String releaseDate;
  int runtime;
  String title;
  double voteAverage;

  MovieDetails({
    this.genres,
    this.id,
    this.overview,
    this.releaseDate,
    this.runtime,
    this.title,
    this.voteAverage,
  });

  MovieDetails.fromJson(Map<String, dynamic> json) {
    if (json['genres'] != null) {
      genres = List<Genres>();
      json['genres'].forEach((v) {
        genres.add(Genres.fromJson(v));
      });
    }
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'].toDouble();
  }
}

class Genres {
  int id;
  String name;
  Genres({this.id, this.name});
  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}
