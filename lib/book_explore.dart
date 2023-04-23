import 'package:book_explore_and_sale_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';
import 'library_page.dart';

class BookExploreApp extends StatelessWidget {
  const BookExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/library',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
      home: LibraryPage(),
      title: 'book_explore_and_sale_app',
      theme: _bookAppTheme(),
    );
  }
}

ThemeData _bookAppTheme() {
  final base = ThemeData.light();
  return base.copyWith(
    appBarTheme: AppBarTheme(
        systemOverlayStyle:
            SystemUiOverlayStyle.dark.copyWith(statusBarColor: Colors.white)),
    inputDecorationTheme: const InputDecorationTheme(
      focusColor: whiteGray,
      filled: true,
      fillColor: whiteGray,
      suffixIconColor: gray,
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(15))),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: gray, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15.0))),
      labelStyle: TextStyle(color: black),
    ),
    textTheme: _bookAppTextTheme(base.textTheme),
  );
}

TextTheme _bookAppTextTheme(TextTheme base) {
  return base
      .copyWith(
          bodyLarge: base.bodyLarge?.copyWith(
              fontSize: 14, fontWeight: FontWeight.w400, color: blue),
          labelMedium: base.labelMedium
              ?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
          titleLarge: base.titleLarge?.copyWith(
              fontSize: 20, letterSpacing: 1, fontWeight: FontWeight.w900),
          headlineMedium: base.headlineMedium
              ?.copyWith(fontSize: 20, fontWeight: FontWeight.w800))
      .apply(
        fontFamily: 'Urbanist',
      );
}
