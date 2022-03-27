import 'package:flutter/material.dart';

// class CustomBottomAppBar extends StatefulWidget {
//   const CustomBottomAppBar({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
// }

// class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
//    int currenIndex = 0;
//   final screens = const [
//     HomeScreen(),
//     ProfileScreen(),
//   ];
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
//               child: MaterialButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 minWidth: 40,
//                 onPressed: () {
//                   NavigationService.pushReplacement(
//                     isNamed: true,
//                     page: RoutePaths.home,
//                   );
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const <Widget>[
//                     Icon(
//                       Icons.home,
//                       size: 32,
//                       // color: currentTab == 3 ? Colors.blue : Colors.grey,
//                     ),
//                     Text(
//                       'Home',
//                       style: TextStyle(
//                           //color: currentTab == 3 ? Colors.blue : Colors.grey,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             const Expanded(
//               child: SizedBox(),
//             ),
//             Expanded(
//               flex: 3,
//               child: MaterialButton(
//                 splashColor: Colors.transparent,
//                 highlightColor: Colors.transparent,
//                 minWidth: 40,
//                 onPressed: () {
//                   NavigationService.pushReplacement(
//                     isNamed: true,
//                     page: RoutePaths.profile,
//                   );
//                 },
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: const <Widget>[
//                     Icon(
//                       Icons.supervisor_account_rounded,
//                       size: 32,
//                       // color: currentTab == 3 ? Colors.blue : Colors.grey,
//                     ),
//                     Text(
//                       'Settings',
//                       style: TextStyle(
//                           //color: currentTab == 3 ? Colors.blue : Colors.grey,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

class CustomBottomAppBar extends StatelessWidget {
  final Function(int) onItemPressed;
  const CustomBottomAppBar({
    required this.onItemPressed,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  onItemPressed(0);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.home,
                      size: 32,
                      // color: currentTab == 3 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      'Home',
                      style: TextStyle(
                          //color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: SizedBox(),
            ),
            Expanded(
              flex: 3,
              child: MaterialButton(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                minWidth: 40,
                onPressed: () {
                  
                  onItemPressed(1);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(
                      Icons.supervisor_account_rounded,
                      size: 32,
                      // color: currentTab == 3 ? Colors.blue : Colors.grey,
                    ),
                    Text(
                      'Settings',
                      style: TextStyle(
                          //color: currentTab == 3 ? Colors.blue : Colors.grey,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
