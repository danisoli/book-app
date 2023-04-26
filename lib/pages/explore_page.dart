import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../colors.dart';
import '../model/book_repository.dart';
import '../model/books.dart';
import '../widgets/explore_categuries_card.dart';
import '../widgets/explore_image_page.dart';
import '../widgets/keyboard_dismisser.dart';
import '../widgets/my_app_bar.dart';
import '../widgets/my_navigation_bar.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  static const routeName = '/explore';

  final FocusNode searchBarFocusNode = FocusNode();

  final TextEditingController searchController = TextEditingController();

  final controller = PageController(keepPage: true);

  @override
  Widget build(BuildContext context) {
    final allPages = pages(
        context,
        'Find out the best books to read when you don’t even know what to read!!!',
        'Explore');

    return keyboardDismisser(
      controller: searchController,
      context: context,
      child: Scaffold(
        bottomNavigationBar: const MyNavigationBar(
          page: 1,
          height: 65,
        ),
        appBar: myAppBar(searchController),
        body: Container(
          decoration: const BoxDecoration(color: Colors.white),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Container(
                  width: 350,
                  height: 150,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: PageView.builder(
                      controller: controller,
                      itemBuilder: (_, item) {
                        return allPages[item % allPages.length];
                      }),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SmoothPageIndicator(
                  controller: controller,
                  count: allPages.length,
                  effect: const ExpandingDotsEffect(
                      activeDotColor: yellow,
                      dotHeight: 7,
                      dotWidth: 7,
                      spacing: 4,
                      expansionFactor: 7),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Categuries',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: blue, fontSize: 20, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
              const SizedBox(
                height: 6,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ExploreTabBar(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}