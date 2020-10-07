import 'package:get/get.dart';
import 'package:movie_test_app/controllers/details_movie_controller.dart';
import 'package:movie_test_app/data/network.dart';
import 'package:movie_test_app/data/repository.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsMovieController>(() {
      final network = Network();
      final repository = Repository(network);
      return DetailsMovieController(repository);
    });
  }
}
