import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: CustomButton(
              text: "Next",
              onPressed: () {},
              color: S.colors.primary,
              textColor: S.colors.background_2)),
    );
  }
}

final hxx2 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 36,
    fontWeight: FontWeight.w500,
    color: S.colors.textColor_1);
