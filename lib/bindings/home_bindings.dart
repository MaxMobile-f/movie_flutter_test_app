import 'package:get/get.dart';
import 'package:movie_test_app/controllers/movie_controller.dart';
import 'package:movie_test_app/data/network.dart';
import 'package:movie_test_app/data/repository.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MovieController>(() {
      final network = Network();
      final repository = Repository(network);
      return MovieController(repository);
    });
  }
}
