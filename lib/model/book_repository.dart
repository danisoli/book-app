import 'books.dart';

class BookRepository {
  static List<Book> bookList(Categuries categuries) {
    const allBooks = <Book>[
      Book(
          categuries: Categuries.biography,
          author: 'Susan R Katy',
          name: 'the-story-of-marie-curie',
          price: 7.99,
          rate: 4),
      Book(
          categuries: Categuries.biography,
          author: 'Hana Alli',
          name: 'at-home-with-muhammad-ali',
          price: 6.5,
          rate: 4),
      Book(
          categuries: Categuries.biography,
          author: 'Alex Haley',
          name: 'malcom-x',
          price: 7.5,
          rate: 4),
      Book(
          categuries: Categuries.biography,
          author: 'Michelle Obama',
          name: 'becoming-michelle-obama',
          price: 6,
          rate: 4),
      Book(
          categuries: Categuries.biography,
          author: 'Susan B katz',
          name: 'the-story-of-walt-disney',
          price: 9,
          rate: 4),
      Book(
          categuries: Categuries.biography,
          author: 'Susan R Katy',
          name: 'the-story-of-marie-curie',
          price: 7.99,
          rate: 4),
      Book(
          categuries: Categuries.biography,
          author: 'Author Name',
          name: 'the-happiest-man-on-earth',
          price: 10,
          rate: 4),
      Book(
          categuries: Categuries.thriller,
          author: 'Cynthia D.S',
          name: 'good-company',
          price: 5,
          rate: 4),
      Book(
          categuries: Categuries.fiction,
          author: 'Emily Henry',
          name: 'book-lovers',
          price: 11,
          rate: 3),
      Book(
          categuries: Categuries.crime,
          author: 'Jodi Picoult',
          name: 'leaving-time',
          price: 12,
          rate: 2),
      Book(
          categuries: Categuries.crime,
          author: 'Angela Marsons',
          name: 'silent-scream',
          price: 7,
          rate: 4),
      Book(
          categuries: Categuries.thriller,
          author: 'Khaled Hosseini',
          name: 'the-kite-runner',
          price: 7.99,
          rate: 4),
      Book(
          categuries: Categuries.thriller,
          author: 'Lily King',
          name: 'father-of-the-rain',
          price: 7.99,
          rate: 4),
    ];
    if (categuries == Categuries.all) {
      return allBooks;
    } else {
      return allBooks.where((Book b) => b.categuries == categuries).toList();
    }
  }
}
