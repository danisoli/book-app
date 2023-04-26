import 'package:book_explore_and_sale_app/string_casing.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/book_repository.dart';
import '../model/books.dart';

Widget tab(String text) {
  return SizedBox(
    height: 20,
    child: Tab(
      text: text,
    ),
  );
}

List<Widget> tabs() {
  return [
    tab('All'),
    tab('Biography'),
    tab('Romance'),
    tab('Thriller'),
    tab('Fiction'),
    tab('Crime'),
    tab('Movie'),
    tab('Religious'),
  ];
}

Widget exploreCateguriesCard(
    {required Book book, required BuildContext context}) {
  final bookName = book.name.split('-').join(' ').toTitleCase();
  return Material(
    color: Colors.white,
    child: InkWell(
      onTap: () {},
      child: SizedBox(
        width: 100,
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Ink.image(
              image: AssetImage(book.assetName),
              width: 100,
              height: 133,
            ),
            SizedBox(
              height: 4,
            ),
            SizedBox(
                height: 24,
                width: 84,
                child: Text(
                  bookName,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontSize: 10, color: blue),
                )),
            SizedBox(
              height: 1,
            ),
            SizedBox(
                height: 10,
                width: 84,
                child: Text(
                  book.author,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium
                      ?.copyWith(fontSize: 8, color: gray),
                )),
            SizedBox(
              height: 1,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 10,
                width: 52,
                child: Row(
                  children: List.generate(
                      5,
                      (index) => Icon(Icons.star,
                          size: 10, color: book.rate > index ? yellow : gray)),
                ),
              ),
            )
          ],
        ),
      ),
    ),
  );
}

class ExploreTabBar extends StatefulWidget {
  const ExploreTabBar({super.key});

  @override
  State<ExploreTabBar> createState() => _ExploreTabBarState();
}

class _ExploreTabBarState extends State<ExploreTabBar>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 8, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height * 0.5,
      child: Column(
        children: [
          SizedBox(
            height: 22,
            child: TabBar(
                onTap: (value) {},
                controller: _tabController,
                isScrollable: true,
                indicatorColor: yellow,
                labelColor: gray,
                labelPadding: EdgeInsets.symmetric(horizontal: 8),
                labelStyle: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 10, fontWeight: FontWeight.w800),
                tabs: tabs()),
          ),
          SizedBox(
            height: 4,
          ),
          ExploreTabBarView(controller: _tabController)
        ],
      ),
    );
  }
}

class ExploreTabBarView extends StatefulWidget {
  ExploreTabBarView({super.key, required this.controller});

  TabController controller;

  @override
  State<ExploreTabBarView> createState() => _ExploreTabBarViewState();
}

class _ExploreTabBarViewState extends State<ExploreTabBarView>
// with TickerProviderStateMixin
{
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
          physics: BouncingScrollPhysics(),
          controller: widget.controller,
          children: List.generate(
              8,
              (index) => Padding(
                    padding:
                        const EdgeInsetsDirectional.symmetric(horizontal: 8.0),
                    child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: BookRepository.bookList(mapCateguries[index])
                            .length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 14,
                            mainAxisSpacing: 14,
                            childAspectRatio: 1 / 1.95,
                            crossAxisCount: 3),
                        itemBuilder: (context, count) {
                          return exploreCateguriesCard(
                              book: BookRepository.bookList(
                                  mapCateguries[index])[count],
                              context: context);
                        }),
                  ))),
    );
  }
}
