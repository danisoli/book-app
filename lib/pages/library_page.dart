import 'package:book_explore_and_sale_app/model/book_repository.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/books.dart';
import '../widgets/keyboard_dismisser.dart';
import '../widgets/library_discover_more.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_library_card.dart';
import '../widgets/my_navigation_bar.dart';
import '../widgets/my_wishlist_card.dart';

class LibraryPage extends StatelessWidget {
  LibraryPage({super.key});
  static const routeName = '/library';

  //final FocusNode searchBarFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return keyboardDismisser(
      controller: searchController,
      //focusNode: searchBarFocusNode,
      context: context,
      child: Scaffold(
        bottomNavigationBar: const MyNavigationBar(
          page: 0,
          height: 65,
        ),
        backgroundColor: Colors.white,
        appBar: myAppBar(searchController),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12, 0, 0),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                'Hi Emily',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(
                height: 28,
              ),
              Text(
                'My Library',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: blue),
              ),
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    myLibraryCard(context, 100, 'assets/images/ghost-boys.png'),
                    myLibraryCard(
                        context, 60, 'assets/images/julia-alvares.png'),
                    discoverMore(),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'My Wishlist',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: yellow),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                    width: 55,
                    child: OutlinedButton(
                        onPressed: () {},
                        style:
                            OutlinedButton.styleFrom(padding: EdgeInsets.zero),
                        child: Text(
                          'See More',
                          softWrap: false,
                          style:
                              Theme.of(context).textTheme.labelLarge?.copyWith(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                    color: yellow,
                                  ),
                        )),
                  ),
                  SizedBox(width: 12)
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 230,
                  height:
                      BookRepository.bookList(Categuries.all).length / 2 * 90,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          BookRepository.bookList(Categuries.all).length - 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
                              childAspectRatio: 1.7 / 1,
                              crossAxisSpacing: 2),
                      itemBuilder: (context, count) {
                        return myWishlistCard(
                            book:
                                BookRepository.bookList(Categuries.all)[count],
                            context: context);
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// GridView(
//                     physics: const NeverScrollableScrollPhysics(),
//                     gridDelegate:
//                         const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2),
//                     children: BookRepository.bookList(Categuries.all)
//                         .map((Book book) =>
//                             myWishlistCard(book: book, context: context))
//                         .toList(),



// appBar: AppBar(
//   backgroundColor: Colors.white,
//   actions: [
//     Align(
//       alignment: Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16.0),
//         child: IconButton(
//           onPressed: () {},
//           icon: Image.asset(
//             'assets/images/menu-icon.png',
//             scale: 2,
//           ),
//         ),
//       ),
//     ),
//     const SizedBox(
//       width: 50,
//       height: 36,
//       child: TextField(
//         decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
//       ),
//     ),
//     IconButton(
//         onPressed: () {},
//         icon: Image.asset(
//           'assets/images/qr-code.png',
//           scale: 2,
//         )),
//     IconButton(
//         onPressed: () {},
//         icon: Icon(
//           Icons.notification_add,
//           color: black,
//         )),
//   ],
// ),
