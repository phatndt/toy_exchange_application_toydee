import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';

class RequestNotificationDoneCard extends StatelessWidget {
  const RequestNotificationDoneCard({
    Key? key,
    required this.status,
  }) : super(key: key);
  final String status;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 150.h,
      decoration: BoxDecoration(
        color: S.colors.background_2,
        borderRadius: BorderRadius.all(
          Radius.circular(S.dimens.defaultBorderRadius),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.h),
        child: Row(
          children: [
            Container(
              height: 110.h,
              width: 110.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.images.homeToy_1),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shape: const CircleBorder(),
                  primary: status == 'accept'
                      ? S.colors.primary
                      : S.colors.background_1,
                  onPrimary: status == 'accept' ? null : S.colors.primary,
                  onSurface: Colors.transparent,
                ),
                onPressed: () {},
                child: Icon(
                  status == 'accept'
                      ? FontAwesomeIcons.checkDouble
                      : FontAwesomeIcons.xmark,
                ),
              ),
            ),
            Container(
              height: 110.h,
              width: 110.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(R.images.homeToy_1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
