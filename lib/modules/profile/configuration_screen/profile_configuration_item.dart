import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/styles/styles.dart';

class ProfileConfigurationItem extends StatelessWidget {
  const ProfileConfigurationItem({
    Key? key,
    required this.icon,
    required this.label,
    required this.information,
    required this.press,
  }) : super(key: key);

  final String label, information;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      elevation: 1,
      color: S.colors.background_2,
      child: InkWell(
        onTap: press,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_8,
                        vertical: S.dimens.defaultPadding_8),
                    child: Icon(
                      icon,
                      size: 24,
                      color: S.colors.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    label,
                    style: S.textStyles.titleHeavy,
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Icon(
                      icon,
                      size: 24,
                      color: Colors.transparent,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    information,
                    style: S.textStyles.titleLight,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
