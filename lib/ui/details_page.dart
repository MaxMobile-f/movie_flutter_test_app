import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test_app/controllers/details_movie_controller.dart';

class DetailsPage extends GetWidget<DetailsMovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back),
          ),
          title: Text("Details"),
          elevation: 0,
          centerTitle: true,
        ),
        body: Obx(
          () => SafeArea(
            child: controller.movieDetails() == null
                ? Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        _cell(controller.movieDetails.value.title),
                        _cell(controller.movieDetails.value.overview),
                        _cell(controller.movieDetails.value.releaseDate),
                        _cell(_genres()),
                        _cell(controller.movieDetails.value.voteAverage
                            .toString()),
                        _cell(_duration()),
                      ],
                    ),
                  ),
          ),
        ));
  }

  _cell(title) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Text(
              '$title',
            ),
          ),
          Divider(
            height: 2,
            color: Colors.white,
          ),
        ],
      );

  _genres() {
    List l = [];
    controller.movieDetails.value.genres.forEach((element) {
      l.add(element.name);
    });
    String stringList = l.join(', ');

    return stringList;
  }

  String _duration() {
    int value = controller.movieDetails.value.runtime;
    final int hour = value ~/ 60;
    final int minutes = value % 60;
    return '${hour.toString()}:${minutes.toString().padLeft(2, "0")}';
  }
}
