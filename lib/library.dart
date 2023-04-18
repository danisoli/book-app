import 'package:flutter/material.dart';

import 'colors.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: Image.asset(
            'assets/images/menu-icon.png',
            scale: 2,
          ),
        ),
        elevation: 0,
        title: const SizedBox(
          width: double.maxFinite,
          height: 36,
          child: TextField(
            decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/qr-code.png',
                scale: 2,
              )),
          Stack(children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.notifications,
                  color: blue,
                )),
            Positioned(
              left: 24,
              top: 14,
              child: Container(
                width: 11,
                height: 11,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
            ),
            Positioned(
                left: 26,
                top: 16,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: yellow),
                ))
          ])
        ],
      ),
    );
  }
}

      // appBar: AppBar(
      //   backgroundColor: Colors.white,
      //   actions: [
      //     Align(
      //       alignment: Alignment.centerLeft,
      //       child: Padding(
      //         padding: const EdgeInsets.symmetric(horizontal: 16.0),
      //         child: IconButton(
      //           onPressed: () {},
      //           icon: Image.asset(
      //             'assets/images/menu-icon.png',
      //             scale: 2,
      //           ),
      //         ),
      //       ),
      //     ),
      //     const SizedBox(
      //       width: 50,
      //       height: 36,
      //       child: TextField(
      //         decoration: InputDecoration(suffixIcon: Icon(Icons.search)),
      //       ),
      //     ),
      //     IconButton(
      //         onPressed: () {},
      //         icon: Image.asset(
      //           'assets/images/qr-code.png',
      //           scale: 2,
      //         )),
      //     IconButton(
      //         onPressed: () {},
      //         icon: Icon(
      //           Icons.notification_add,
      //           color: black,
      //         )),
      //   ],
      // ),

