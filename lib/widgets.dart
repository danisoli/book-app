import 'package:book_explore_and_sale_app/colors.dart';
import 'package:book_explore_and_sale_app/model/books.dart';
import 'package:book_explore_and_sale_app/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'route_const.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({
    super.key,
    this.height,
    required this.page,
  });

  final int page;
  final double? height;
  //final List<Widget> item;

  @override
  State<MyNavigationBar> createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  late int _selectedIndex = widget.page;

  List<String> destinations = [
    libraryPageRoute,
    explorePageRoute,
    cartPageRoute,
    communityPageRoute
  ];

  // Navigator.of(context).pushNamed(destinations[_selectedIndex]);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(boxShadow: [
        BoxShadow(color: opacity25, blurRadius: 15, offset: Offset(0, -8))
      ]),
      child: Material(
        child: SizedBox(
          width: double.maxFinite,
          height: widget.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  navigationBarItem(
                      label: 'My Library',
                      svg: 'assets/images/library_icon.svg',
                      onItemTaped: () {
                        setState(() {
                          if (_selectedIndex != 0) {
                            _selectedIndex = 0;
                            Navigator.of(context).pushReplacement(
                                RouteGenerator.generateRoute(RouteSettings(
                                    name: destinations[_selectedIndex])));
                          }
                        });
                      },
                      context: context,
                      selected: _selectedIndex == 0),
                  navigationBarItem(
                      label: 'Explore',
                      svg: 'assets/images/book_icon.svg',
                      onItemTaped: () {
                        setState(() {
                          if (_selectedIndex != 1) {
                            _selectedIndex = 1;
                            Navigator.of(context).pushReplacement(
                                RouteGenerator.generateRoute(RouteSettings(
                                    name: destinations[_selectedIndex])));
                          }
                        });
                      },
                      context: context,
                      selected: _selectedIndex == 1),
                  navigationBarItem(
                      label: 'Card',
                      svg: 'assets/images/shop_icon.svg',
                      onItemTaped: () {
                        setState(() {
                          if (/*_selectedIndex < 2 && */ _selectedIndex != 2) {
                            _selectedIndex = 2;
                            // Navigator.of(context).pushReplacement(
                            //     RouteGenerator.generateRoute(RouteSettings(
                            //         name: destinations[_selectedIndex])));
                          }
                        });
                      },
                      context: context,
                      selected: _selectedIndex == 2),
                  navigationBarItem(
                      label: 'Community',
                      svg: 'assets/images/community_icon.svg',
                      onItemTaped: () {
                        setState(() {
                          if (/*_selectedIndex < 2 && */ _selectedIndex != 3) {
                            _selectedIndex = 3;
                            // Navigator.of(context).pushReplacement(
                            //     RouteGenerator.generateRoute(RouteSettings(
                            //         name: destinations[_selectedIndex])));
                          }
                        });
                      },
                      context: context,
                      selected: _selectedIndex == 3),
                ]),
          ),
        ),
      ),
    );
  }
}

Widget navigationBarItem(
    {required String label,
    required String svg,
    required bool selected,
    required void Function() onItemTaped,
    required BuildContext context}) {
  return SizedBox(
    child: IconButton(
      iconSize: 52,
      onPressed: onItemTaped,
      icon: Column(
        children: [
          SvgPicture.asset(svg, color: selected ? yellow : opacity25),
          const SizedBox(
            height: 4,
          ),
          Text(label,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: selected ? blue : opacity25,
                    fontWeight: FontWeight.normal,
                    fontSize: 10,
                  ))
        ],
      ),
    ),
  );
}

List<Widget> pages(BuildContext context, String content, String buttonLable) {
  return List.generate(3, (index) {
    return Container(
      width: 350,
      height: 150,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
              image: AssetImage('assets/images/explore-book-photo.png'))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(6, 12, 0, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 210,
              height: 50,
              child: Text(
                content,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w800),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 62,
              height: 26,
              child: TextButton(
                  style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 0,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () {},
                  child: Text(
                    buttonLable,
                    style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        color: pink, fontSize: 10, fontWeight: FontWeight.w800),
                  )),
            )
          ],
        ),
      ),
    );
  });
}

PreferredSizeWidget myAppBar(TextEditingController controller) {
  return AppBar(
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
        controller: controller,
        cursorColor: yellow,
        clipBehavior: Clip.antiAlias,
        decoration: const InputDecoration(
            suffixIcon: Icon(Icons.search), contentPadding: EdgeInsets.all(8)),
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
        child: IconButton(
            onPressed: () {},
            icon: const Badge(
              backgroundColor: yellow,
              smallSize: 10,
              child: Icon(
                Icons.notifications,
                color: blue,
              ),
            )),
        //Stack(children: [
        //   IconButton(
        //       onPressed: () {},
        //       icon: const Icon(
        //         Icons.notifications,
        //         color: blue,
        //       )),
        //   Positioned(
        //     left: 24,
        //     top: 11,
        //     child: Container(
        //       width: 11,
        //       height: 11,
        //       decoration: const BoxDecoration(
        //           shape: BoxShape.circle, color: Colors.white),
        //     ),
        //   ),
        //   Positioned(
        //       left: 26,
        //       top: 13,
        //       child: Container(
        //         width: 7,
        //         height: 7,
        //         decoration:
        //             const BoxDecoration(shape: BoxShape.circle, color: yellow),
        //       ))
        // ]),
      )
    ],
  );
}

// class NavigationItemList {
//   NavigationItemList(this.context);
//   BuildContext context;
//   static List<Widget> items = [
//     navigationBarItem(
//         label: 'My Library',
//         svg: 'assets/images/library_icon.svg',
//         onItemTaped: () {},
//         context: context)
//   ];
// }

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

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({super.key});

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _selectedIndex = 0;
  List<String> destinations = [
    libraryPageRoute,
    explorePageRoute,
    cartPageRoute,
    communityPageRoute
  ];

  void _onItemTaped(int item) {
    setState(() {
      if (item < 2) {
        _selectedIndex = item;
        Navigator.of(context).pushNamed(destinations[_selectedIndex]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: _onItemTaped,
      currentIndex: _selectedIndex,
      selectedItemColor: blue,
      unselectedItemColor: gray,
      landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
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

// NavigationBar(
//         selectedIndex: _selectedIndex,
//         onDestinationSelected: _onItemTaped,
//         destinations: [
//           NavigationDestination(
//               icon: SvgPicture.asset(
//                 'assets/images/library_icon.svg',
//                 color: opacity25,
//               ),
//               selectedIcon: SvgPicture.asset(
//                 'assets/images/library_icon.svg',
//                 color: yellow,
//               ),
//               label: 'My Library'),
//           NavigationDestination(
//               icon: SvgPicture.asset(
//                 'assets/images/explore_icon.svg',
//                 color: opacity25,
//               ),
//               selectedIcon: SvgPicture.asset(
//                 'assets/images/explore_icon.svg',
//                 color: yellow,
//               ),
//               label: 'Explore'),
//           NavigationDestination(
//               icon: SvgPicture.asset(
//                 'assets/images/shop_icon.svg',
//                 color: opacity25,
//               ),
//               selectedIcon: SvgPicture.asset(
//                 'assets/images/shop_icon.svg',
//                 color: yellow,
//               ),
//               label: 'Cart'),
//           NavigationDestination(
//               icon: SvgPicture.asset(
//                 'assets/images/community_icon.svg',
//                 color: opacity25,
//               ),
//               selectedIcon: SvgPicture.asset(
//                 'assets/images/community_icon.svg',
//                 color: yellow,
//               ),
//               label: 'Community')
//         ]);

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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Ink.image(
              image: AssetImage(book.assetName),
              width: 60,
              height: 85,
            ),
            const SizedBox(
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
  );
}

List<Widget> tabs() {
  return const [
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
    Tab(
      text: 'ss',
    ),
  ];
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
