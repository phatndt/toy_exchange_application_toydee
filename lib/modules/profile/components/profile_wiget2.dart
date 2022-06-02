import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';

class ProfileWidget2 extends StatelessWidget {
  const ProfileWidget2({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              //color: Colors.transparent, // Button color
              child: InkWell(
                  //splashColor: Colors.red, // Splash color
                  onTap: onPressed,
                  child: Image.asset(
                    imagePath,
                    height: 128,
                    width: 128,
                  )),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.all(3.0),
                color: S.colors.background_2,
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: S.colors.primary,
                    child: const Icon(
                      Icons.edit,
                      size: 15.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
