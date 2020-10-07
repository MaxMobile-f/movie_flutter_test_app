import 'package:get/get.dart';
import 'package:movie_test_app/data/movie_details_model.dart';
import 'package:movie_test_app/data/repository.dart';

class DetailsMovieController extends GetxController {
  DetailsMovieController(this.repository);
  final Repository repository;

  Rx<MovieDetails> movieDetails = Rx<MovieDetails>();

  @override
  void onInit() => fetchDetailsData();

  fetchDetailsData() async {
    movieDetails.value =
        await repository.getDetailsData(id: Get.arguments.id.toString());
  }
}
