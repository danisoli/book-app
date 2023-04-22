import 'package:book_explore_and_sale_app/library.dart';
import 'package:book_explore_and_sale_app/route_const.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case libraryPageRoute:
        return MaterialPageRoute(builder: (context) => Library());
      // case explorePageRoute:
      //   return MaterialPageRoute(builder: (context) => Explore());
      default:
        return MaterialPageRoute(builder: (context) => Library());
    }
  }
}
