import 'package:flutter/material.dart';
import 'package:book_explore_and_sale_app/widgets.dart';
import 'package:flutter/services.dart';
import 'colors.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:
            const SystemUiOverlayStyle(statusBarColor: Colors.white),
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
            cursorColor: yellow,
            clipBehavior: Clip.antiAlias,
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.search),
                contentPadding: EdgeInsets.all(8)),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(
                'assets/images/qr-code.png',
                scale: 2,
              )),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Stack(children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: blue,
                  )),
              Positioned(
                left: 24,
                top: 11,
                child: Container(
                  width: 11,
                  height: 11,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Positioned(
                  left: 26,
                  top: 13,
                  child: Container(
                    width: 7,
                    height: 7,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: yellow),
                  ))
            ]),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(18.0, 12, 0, 0),
        child: ListView(
          children: [
            Text(
              'Hi Emily',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 28,
            ),
            Text(
              'My Library',
              style:
                  Theme.of(context).textTheme.titleLarge?.copyWith(color: blue),
            ),
            const SizedBox(
              height: 16,
            ),
            SizedBox(
              height: 200,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  myLibraryCard(context, 100, 'assets/images/ghost-boys.png'),
                  myLibraryCard(context, 60, 'assets/images/julia-alvares.png'),
                  discoverMore(),
                ],
              ),
            )
          ],
        ),
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
