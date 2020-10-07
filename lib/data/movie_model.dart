class Movie {
  List<Result> results;
  Movie({this.results});

  Movie.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = List<Result>();
      json['results'].forEach((v) {
        results.add(Result.fromJson(v));
      });
    }
  }
}

class Result {
  String posterPath;
  int id;

  Result({this.posterPath, this.id});

  Result.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
  }
}
