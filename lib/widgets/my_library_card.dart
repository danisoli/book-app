import 'package:flutter/material.dart';

import '../colors.dart';

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
