import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../styles/styles.dart';

final stateProvider = StateProvider<int>(
  (ref) => 0,
);

// class CustomBottomAppBar extends StatefulWidget {
//   final Function(int) onItemPressed;
//   const CustomBottomAppBar({
//     required this.onItemPressed,
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
// }

// class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
//   int currentTab = 0;
//   @override
//   Widget build(BuildContext context) {
//     return BottomAppBar(
//       shape: const CircularNotchedRectangle(),
//       notchMargin: 10,
//       elevation: 10,
//       child: SizedBox(
//         height: 60,
//         child: Row(
//           children: <Widget>[
//             Expanded(
//               flex: 3,
//               child: BottomAppBarItem(
//                 currentTab: 0,
//                 onPressed: () {
//                   widget.onItemPressed(0);
//                   setState(() {
//                     currentTab = 0;
//                   });
//                 },
//               ),
//             ),
//             const Expanded(
//               child: SizedBox(),
//             ),
//             Expanded(
//                 flex: 3,
//                 child: BottomAppBarItem(
//                   currentTab: 1,
//                   onPressed: () {
//                     widget.onItemPressed(1);
//                     setState(() {
//                       currentTab = 1;
//                     });
//                   },
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomBottomAppBar extends ConsumerWidget {
  final Function(int) onItemPressed;
  const CustomBottomAppBar({
    required this.onItemPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);

    int currentTab = 0;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      elevation: 10,
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: BottomAppBarItem(
                currentTab: 0,
                icon: FontAwesomeIcons.house,
                text: "Home",
                onPressed: () {
                  onItemPressed(0);
                  ref.read(stateProvider.notifier).update((state) => state = 0);
                },
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: BottomAppBarItem(
                currentTab: 1,
                icon: FontAwesomeIcons.userLarge,
                text: "Me",
                onPressed: () {
                  onItemPressed(1);
                  ref.read(stateProvider.notifier).update((state) => state = 1);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomAppBarItem extends ConsumerWidget {
  const BottomAppBarItem({
    Key? key,
    required this.currentTab,
    required this.icon,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  final int currentTab;
  final IconData icon;
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(stateProvider);
    return MaterialButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      minWidth: 40,
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: 26,
            color: provider == currentTab ? S.colors.primary : S.colors.gray_3,
          ),
          Text(
            text,
            style: provider == currentTab
                ? S.textStyles.navSelected
                : S.textStyles.nav,
          ),
        ],
      ),
    );
  }
}
