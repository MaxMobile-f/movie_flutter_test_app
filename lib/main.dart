import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_test_app/ui/home_page.dart';
import 'bindings/details_bindings.dart';
import 'bindings/home_bindings.dart';
import 'constants.dart';
import 'ui/details_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          textTheme: TextTheme(
            bodyText2: TextStyle(color: colorWhite),
          ),
          scaffoldBackgroundColor: colorBlack,
          appBarTheme: AppBarTheme(color: colorBlack)),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => HomePage(), binding: HomeBinding()),
        GetPage(
            name: '/details',
            page: () => DetailsPage(),
            binding: DetailsBinding()),
      ],
    );
  }
}
