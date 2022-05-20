import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../routing/navigation_service.dart';
import '../styles/styles.dart';
import 'custom_icon_button.dart';

class HeaderScreen extends StatelessWidget {
  const HeaderScreen({
    Key? key,
    required this.title,
    this.padding = 0,
  }) : super(key: key);

  final String title;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: S.dimens.defaultPadding_48,
            child: Center(
              child: Text(
                title,
                style: S.textStyles.h2Primary,
              ),
            ),
          ),
          CustomIconButton(
            text: FontAwesomeIcons.angleLeft,
            backgroundColor: S.colors.background_2,
            color: S.colors.primary,
            onPressed: () {
              NavigationService.goBack();
            },
          ),
        ],
      ),
    );
    ;
  }
}
