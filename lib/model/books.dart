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
