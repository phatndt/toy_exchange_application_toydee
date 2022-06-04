import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';

class SwapToyCard extends StatelessWidget {
  const SwapToyCard({
    Key? key,
    required this.name,
    required this.condition,
    required this.showingImage,
    required this.uid,
  }) : super(key: key);

  final String name;
  final int condition;
  final String showingImage;
  final String uid;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          S.dimens.defaultBorderRadius,
        ),
      ),
      color: S.colors.background_1,
      child: InkWell(
        onTap: () {
          NavigationService.push(
            page: RoutePaths.toyDetailScreen,
            isNamed: true,
            arguments: uid,
          );
        },
        child: Column(
          children: [
            Container(
              height: ScreenUtil().scaleHeight * 180,
              decoration: BoxDecoration(
                color: S.colors.lavender,
                borderRadius: BorderRadius.all(
                  Radius.circular(S.dimens.defaultBorderRadius),
                ),
                image: DecorationImage(
                    image: NetworkImage(showingImage), fit: BoxFit.fill),
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_8,
            ),
            Padding(
              padding: EdgeInsets.only(left: S.dimens.defaultPadding_4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: ScreenUtil().scaleWidth * 110,
                    child: Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: S.textStyles.titleHeavyBoldPrimary,
                    ),
                  ),
                  Container(
                    width: 50.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                      color: S.colors.accent_5,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          S.dimens.defaultPadding_16,
                        ),
                        bottomLeft: Radius.circular(
                          S.dimens.defaultPadding_16,
                        ),
                      ),
                    ),
                    child: Icon(
                      FontAwesomeIcons.retweet,
                      color: S.colors.primary,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_4,
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    condition == 0
                        ? FontAwesomeIcons.faceGrin
                        : FontAwesomeIcons.faceFrown,
                    size: 20.w,
                  ),
                  Text(
                    "15 Km",
                    overflow: TextOverflow.ellipsis,
                    style: S.textStyles.titleHeavyPrimary,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: S.dimens.defaultPadding_4,
            ),
          ],
        ),
      ),
    );
  }
}
