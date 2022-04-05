import 'package:flutter/material.dart';

class ProfileTab1 extends StatelessWidget {
  const ProfileTab1({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}
