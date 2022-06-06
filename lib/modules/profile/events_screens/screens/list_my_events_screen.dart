import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';

import '../../../../core/routing/route_paths.dart';
import '../../../../core/styles/styles.dart';
import '../../../../core/styles/text.dart';

class ListMyEvents extends StatelessWidget {
  const ListMyEvents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: S.dimens.defaultPadding_8,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    T.eventMyListTitle,
                    style: S.textStyles.h3,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: S.dimens.defaultPadding_8,
                horizontal: S.dimens.defaultPadding_16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomIconButton(
                    color: S.colors.primary,
                    backgroundColor: S.colors.accent_5,
                    text: FontAwesomeIcons.arrowLeft,
                    onPressed: () {
                      NavigationService.goBack();
                    },
                  ),
                  CustomIconButton(
                    color: S.colors.primary,
                    backgroundColor: S.colors.accent_5,
                    text: FontAwesomeIcons.plus,
                    onPressed: () {
                      NavigationService.push(
                          isNamed: true, page: RoutePaths.uploadEvents);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
