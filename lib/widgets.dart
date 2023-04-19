import 'package:book_explore_and_sale_app/colors.dart';
import 'package:flutter/material.dart';

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
              ))),
      const Expanded(child: SizedBox())
    ],
  );
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
          height: 200,
          width: 110,
          child: Column(children: [
            Image.asset(
              image,
              scale: 2,
            ),
            const SizedBox(
              height: 12,
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
              height: 14,
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
