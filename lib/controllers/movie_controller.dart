import 'package:get/get.dart';
import 'package:movie_test_app/data/movie_model.dart';
import 'package:movie_test_app/data/repository.dart';

import '../constants.dart';

class MovieController extends GetxController {
  MovieController(this.repository);
  final Repository repository;

  Rx<Movie> popularMovies = Rx<Movie>();
  Rx<Movie> topMovies = Rx<Movie>();
  Rx<Movie> upcomingMovies = Rx<Movie>();

  @override
  void onInit() => fetchData();

  void fetchData() async {
    popularMovies.value = await repository.getData(type: popular);
    topMovies.value = await repository.getData(type: topRated);
    upcomingMovies.value = await repository.getData(type: upcoming);
  }
}
