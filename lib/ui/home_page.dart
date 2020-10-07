import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test_app/constants.dart';
import 'package:movie_test_app/controllers/movie_controller.dart';
import 'package:movie_test_app/data/movie_model.dart';
import 'package:movie_test_app/ui/widgets/list_title.dart';

class HomePage extends GetWidget<MovieController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTitle(title: 'Popular'),
                _horizontalList(controller.popularMovies),
                ListTitle(title: 'Top rated'),
                _horizontalList(controller.topMovies),
                ListTitle(title: 'Upcoming'),
                _horizontalList(controller.upcomingMovies),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _horizontalList(apiModel) {
    return apiModel() == null
        ? Container(
            height: Get.height * 0.42,
            child: Center(child: CircularProgressIndicator()))
        : Container(
            height: Get.height * 0.42,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: apiModel.value.results.length,
                itemBuilder: (context, index) {
                  Result result = apiModel.value.results[index];
                  return InkWell(
                    onTap: () {
                      Get.toNamed('/details', arguments: result);
                    },
                    child: Container(
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${result.posterPath}',
                        fit: BoxFit.fill,
                        loadingBuilder: (BuildContext context, Widget child,
                            ImageChunkEvent loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes
                                  : null,
                            ),
                          );
                        },
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorWhite,
                          width: 2.0,
                        ),
                      ),
                    ),
                  );
                }),
          );
  }
}
