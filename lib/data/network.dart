import 'package:dio/dio.dart';

import '../constants.dart';
import 'movie_details_model.dart';
import 'movie_model.dart';

class Network {
  String _baseUrl = 'https://api.themoviedb.org/3/movie/';

  Future fetchData({String type}) async {
    String _theMovieDbUrl =
        '$_baseUrl$type?api_key=$apiKey&language=en-US&page=1';
    try {
      final response = await Dio().get('$_theMovieDbUrl');
      return Movie.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<MovieDetails> fetchDetailsData({String id}) async {
    String _movieDetailsUrl = '$_baseUrl$id?api_key=$apiKey&language=en-US';
    try {
      final response = await Dio().get(_movieDetailsUrl);
      return MovieDetails.fromJson(response.data);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
