import 'package:flutter/material.dart';

import 'colors.dart';
import 'library.dart';

class BookExploreApp extends StatelessWidget {
  const BookExploreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'book_explore_and_sale_app',
      home: Library(),
      theme: _bookAppTheme(),
    );
  }
}

ThemeData _bookAppTheme() {
  final base = ThemeData.light();
  return base.copyWith(
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
      textTheme: _bookAppTextTheme(base.textTheme));
}

TextTheme _bookAppTextTheme(TextTheme base) {
  return base
      .copyWith(
          titleLarge: base.titleLarge
              ?.copyWith(color: blue, fontWeight: FontWeight.w300),
          headlineSmall: base.headlineSmall?.copyWith(color: blue))
      .apply(fontFamily: 'Rubik', displayColor: blue, bodyColor: blue);
}
