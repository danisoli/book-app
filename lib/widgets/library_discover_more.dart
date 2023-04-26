import 'package:flutter/material.dart';

import '../colors.dart';

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
