import 'package:book_explore_and_sale_app/model/book_repository.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';
import 'package:book_explore_and_sale_app/model/books.dart';
import 'colors.dart';

class Library extends StatelessWidget {
  Library({super.key});

  static const routeName = '/library';

  final FocusNode searchBarFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return keyboardDismisser(
      controller: searchController,
      //focusNode: searchBarFocusNode,
      context: context,
      child: Scaffold(
        bottomNavigationBar: const MyBottonNavigationBar(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          // systemOverlayStyle: const SystemUiOverlayStyle(
          //     systemStatusBarContrastEnforced: true),
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/images/icons/menu-icon.png',
              scale: 2,
            ),
          ),
          elevation: 0,
          title: SizedBox(
            width: double.maxFinite,
            height: 36,
            child: TextField(
              controller: searchController,
              cursorColor: yellow,
              clipBehavior: Clip.antiAlias,
              decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.all(8)),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'assets/images/icons/qr-code.png',
                  scale: 2,
                )),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Stack(children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: blue,
                    )),
                Positioned(
                  left: 24,
                  top: 11,
                  child: Container(
                    width: 11,
                    height: 11,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.white),
                  ),
                ),
                Positioned(
                    left: 26,
                    top: 13,
                    child: Container(
                      width: 7,
                      height: 7,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: yellow),
                    ))
              ]),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(18.0, 12, 0, 0),
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
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 230,
                  height:
                      BookRepository.bookList(Categuries.all).length / 2 * 140,
                  child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount:
                          BookRepository.bookList(Categuries.all).length - 1,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 2,
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
