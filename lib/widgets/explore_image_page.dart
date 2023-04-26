import 'package:flutter/material.dart';

import '../colors.dart';

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
