import 'package:book_explore_and_sale_app/route_management/route_const.dart';
import 'package:book_explore_and_sale_app/string_casing.dart';
import 'package:flutter/material.dart';

import '../colors.dart';
import '../model/books.dart';

Widget myWishlistCard({required Book book, required BuildContext context}) {
  final String bookName = book.name.split('-').join(' ').toTitleCase();
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(bookPageRoute, arguments: book);
        },
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
                        children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                size: 10,
                                color: book.rate > index ? yellow : gray))
                        // const [
                        //   Icon(
                        //     Icons.star,
                        //     size: 10,
                        //     color: yellow,
                        //   ),
                        //   Icon(
                        //     Icons.star,
                        //     size: 10,
                        //     color: yellow,
                        //   ),
                        //   Icon(
                        //     Icons.star,
                        //     size: 10,
                        //     color: yellow,
                        //   ),
                        //   Icon(
                        //     Icons.star,
                        //     size: 10,
                        //     color: yellow,
                        //   ),
                        //   Icon(
                        //     Icons.star,
                        //     size: 10,
                        //     color: blackGray,
                        //   ),
                        // ],
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
