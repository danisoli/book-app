import 'package:book_explore_and_sale_app/colors.dart';
import 'package:book_explore_and_sale_app/model/book_repository.dart';
import 'package:book_explore_and_sale_app/model/books.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

Widget navigationBarItem(
    {required String label,
    required String svg,
    required BuildContext context}) {
  return SizedBox(
      width: 50,
      height: 50,
      child: Column(
        children: [
          SvgPicture.asset(
            svg,
          ),
          SizedBox(
            height: 10,
          ),
          Text(label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: yellow,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ))
        ],
      ));
}

Widget discoverMore() {
  return Column(
    children: [
      Material(
        color: Colors.white,
        child: InkWell(
            borderRadius: BorderRadius.circular(5),
            onTap: () {},
            child: SizedBox(
              width: 100,
              height: 150,
              child: Stack(children: [
                Image.asset(
                  'assets/images/dotted-border.png',
                  scale: 2,
                  alignment: Alignment.topLeft,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.add,
                        color: blackGray,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        'Dicover More',
                        style: TextStyle(
                            fontSize: 12,
                            fontFamily: 'Urbanist',
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                )
              ]),
            )),
      ),
      const Expanded(child: SizedBox())
    ],
  );
}

class MyBottonNavigationBar extends StatefulWidget {
  const MyBottonNavigationBar({super.key});

  @override
  State<MyBottonNavigationBar> createState() => _MyBottonNavigationBarState();
}

class _MyBottonNavigationBarState extends State<MyBottonNavigationBar> {
  int _selectedIndex = 0;

  void _onItemTaped(int item) {
    setState(() {
      _selectedIndex = item;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTaped,
      currentIndex: _selectedIndex,
      selectedItemColor: yellow,
      unselectedItemColor: gray,
      items: [
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/library_icon.svg',
              color: opacity25,
            ),
            label: 'My Library',
            activeIcon: SvgPicture.asset(
              'assets/images/library_icon.svg',
              color: yellow,
            )),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/book_icon.svg',
              color: opacity25,
            ),
            label: 'Explore',
            activeIcon: SvgPicture.asset(
              'assets/images/book_icon.svg',
              color: yellow,
            )),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/shop_icon.svg',
              color: opacity25,
            ),
            label: 'Cart',
            activeIcon: SvgPicture.asset(
              'assets/images/shop_icon.svg',
              color: yellow,
            )),
        BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/images/community_icon.svg',
              color: opacity25,
            ),
            label: 'Community',
            activeIcon: SvgPicture.asset(
              'assets/images/community_icon.svg',
              color: yellow,
            )),
      ],
    );
  }
}

// NavigationBar(destinations: [
//       navigationBarItem(label: '', svg: svg)

// class MyWishlistCard extends StatefulWidget {
//   const MyWishlistCard({super.key, required this.book, required this.context});

//   final Book book;
//   final BuildContext context;

//   @override
//   State<MyWishlistCard> createState() => _MyWishlistCardState();
// }

// class _MyWishlistCardState extends State<MyWishlistCard> {

//   late final String bookName = widget.book.name.split('-').join(' ').toTitleCase();

//   @override
//   Widget build(context) {
//     return Container(
//     width: 138,
//     height: 85,
//     padding: EdgeInsets.symmetric(),
//     decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
//     clipBehavior: Clip.antiAlias,
//     child: Material(
//       child: InkWell(
//         onTap: () {},
//         child: SizedBox(
//           width: 138,
//           height: 86,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Ink.image(
//                 image: AssetImage(widget.book.assetName),
//                 width: 60,
//                 height: 85,
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               SizedBox(
//                 child: Column(
//                   children: [
//                     SizedBox(
//                       width: 65,
//                       child: Text(
//                         bookName,
//                         softWrap: true,
//                         overflow: TextOverflow.fade,
//                         style: Theme.of(context)
//                             .textTheme
//                             .labelMedium
//                             ?.copyWith(fontSize: 10, color: blue),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       width: 65,
//                       child: Text(
//                         widget.book.author,
//                         softWrap: true,
//                         style: Theme.of(context)
//                             .textTheme
//                             .labelMedium
//                             ?.copyWith(fontSize: 10, color: gray),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 28,
//                     ),
//                     SizedBox(
//                       width: 52,
//                       height: 10,
//                       child: Row(
//                         children: [],
//                       ),
//                     )
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     ),
//   );
//   }
// }

Widget myWishlistCard({required Book book, required BuildContext context}) {
  final String bookName = book.name.split('-').join(' ').toTitleCase();
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 30),
    child: Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Ink.image(
                image: AssetImage(book.assetName),
                width: 60,
                height: 85,
              ),
              SizedBox(
                width: 5,
              ),
              SizedBox(
                child: Column(
                  children: [
                    SizedBox(
                      width: 65,
                      child: Text(
                        bookName,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontSize: 10, color: blue),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    SizedBox(
                      width: 65,
                      child: Text(
                        book.author,
                        softWrap: false,
                        overflow: TextOverflow.fade,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(fontSize: 10, color: gray),
                      ),
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    SizedBox(
                      width: 52,
                      height: 10,
                      child: Row(
                        children: const [
                          Icon(
                            Icons.star,
                            size: 10,
                            color: yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: yellow,
                          ),
                          Icon(
                            Icons.star,
                            size: 10,
                            color: blackGray,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}

Widget keyboardDismisser(
    {required BuildContext context,
    required Widget child,
    //required FocusNode focusNode,
    required TextEditingController controller}) {
  final gesture = GestureDetector(
    onTap: () {
      //focusNode.unfocus();
      controller.clear();
      FocusScope.of(context).requestFocus(FocusNode());
      // I don't know what ⬇⬇ doing
      SystemChannels.textInput.invokeMethod('TextInput.hide');
    },
    child: child,
  );
  return gesture;
}

Widget myLibraryCard(BuildContext context, int progres, String image) {
  return Padding(
    padding: const EdgeInsets.only(right: 10.0),
    child: Material(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(5),
        onTap: () {},
        child: SizedBox(
          width: 110,
          child: Column(children: [
            Ink.image(
              alignment: Alignment.topCenter,
              width: 110,
              height: 150,
              image: AssetImage(image),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Name of Book',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(color: black),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Stack(
                  children: [
                    Container(
                      width: 86,
                      height: 4,
                      decoration: BoxDecoration(
                          color: whiteGray,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    Container(
                      width: 86 * (progres / 100),
                      height: 4,
                      decoration: BoxDecoration(
                          color: blue, borderRadius: BorderRadius.circular(2)),
                    ),
                  ],
                ),
                const SizedBox(
                  width: 6,
                ),
                Text(
                  '$progres%',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontSize: 8, fontWeight: FontWeight.w600),
                )
              ],
            )
          ]),
        ),
      ),
    ),
  );
}
