import 'explore_page.dart';
import 'library_page.dart';
import 'route_const.dart';
import 'package:flutter/material.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final routes = <String, Route>{
      libraryPageRoute: MaterialPageRoute(builder: (context) => LibraryPage()),
      explorePageRoute: MaterialPageRoute(builder: (context) => ExplorePage())
    };
    return routes[settings.name]!;
  }

  // static Route<dynamic> generateRoute(RouteSettings settings) {
  //   switch (settings.name) {
  //     case libraryPageRoute:
  //       return MaterialPageRoute(builder: (context) => LibraryPage()),
  //
  //     case explorePageRoute:
  //       return MaterialPageRoute(builder: (context) => ExplorePage());
  //     // case cartPageRoute:
  //     //   return MaterialPageRoute(builder: (context) => ExplorePage());
  //     // case communityPageRoute:
  //     //   return MaterialPageRoute(builder: );
  //     default:
  //       return MaterialPageRoute(builder: (context) => LibraryPage());
  //   }
  // }
}
