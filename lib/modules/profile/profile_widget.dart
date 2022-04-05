import 'package:flutter/material.dart';

import '../../core/styles/styles.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);
  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final image = NetworkImage(imagePath);

    return Center(
      child: Stack(
        children: [
          ClipOval(
            child: Material(
              // color: Colors.transparent,
              child: Ink.image(
                image: image,
                fit: BoxFit.cover,
                width: 128,
                height: 128,
                child: InkWell(
                  onTap: onPressed,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 4,
            child: ClipOval(
              child: Container(
                padding: const EdgeInsets.all(4.0),
                color: S.colors.background_2,
                child: ClipOval(
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: S.colors.primary,
                    child: const Icon(
                      Icons.edit,
                      size: 20.0,
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
