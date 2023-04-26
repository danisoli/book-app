import 'package:flutter/material.dart';

import '../colors.dart';

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
