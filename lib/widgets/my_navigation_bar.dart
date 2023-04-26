import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../colors.dart';
import '../route_management/route_const.dart';
import '../route_management/route_generator.dart';

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

// class MyBottomNavigationBar extends StatefulWidget {
//   const MyBottomNavigationBar({super.key});

//   @override
//   State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
// }

//  class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
//   int _selectedIndex = 0;
//   List<String> destinations = [
//     libraryPageRoute,
//     explorePageRoute,
//     cartPageRoute,
//     communityPageRoute
//   ];

//   void _onItemTaped(int item) {
//     setState(() {
//       if (item < 2) {
//         _selectedIndex = item;
//         Navigator.of(context).pushNamed(destinations[_selectedIndex]);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       type: BottomNavigationBarType.fixed,
//       onTap: _onItemTaped,
//       currentIndex: _selectedIndex,
//       selectedItemColor: blue,
//       unselectedItemColor: gray,
//       landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
//       items: [
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/images/library_icon.svg',
//               color: opacity25,
//             ),
//             label: 'My Library',
//             activeIcon: SvgPicture.asset(
//               'assets/images/library_icon.svg',
//               color: yellow,
//             )),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/images/book_icon.svg',
//               color: opacity25,
//             ),
//             label: 'Explore',
//             activeIcon: SvgPicture.asset(
//               'assets/images/book_icon.svg',
//               color: yellow,
//             )),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/images/shop_icon.svg',
//               color: opacity25,
//             ),
//             label: 'Cart',
//             activeIcon: SvgPicture.asset(
//               'assets/images/shop_icon.svg',
//               color: yellow,
//             )),
//         BottomNavigationBarItem(
//             icon: SvgPicture.asset(
//               'assets/images/community_icon.svg',
//               color: opacity25,
//             ),
//             label: 'Community',
//             activeIcon: SvgPicture.asset(
//               'assets/images/community_icon.svg',
//               color: yellow,
//             )),
//       ],
//     );
//   }
// }

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
