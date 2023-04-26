enum Categuries {
  all,
  biography,
  romance,
  thriller,
  fiction,
  crime,
  movie,
  religious
}

Map mapCateguries = {
  0: Categuries.all,
  1: Categuries.biography,
  2: Categuries.romance,
  3: Categuries.thriller,
  4: Categuries.fiction,
  5: Categuries.crime,
  6: Categuries.movie,
  7: Categuries.religious,
};

class Book {
  const Book({
    required this.categuries,
    required this.author,
    required this.name,
    required this.price,
    required this.rate,
  });

  final Categuries categuries;
  final String name;
  final String author;
  final double price;
  final int rate;

  String get assetName => 'assets/images/books/$name.png';
}
