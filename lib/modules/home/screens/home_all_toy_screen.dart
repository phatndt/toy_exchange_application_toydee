import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';

class HomeAllToyScreen extends StatelessWidget {
  const HomeAllToyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: S.dimens.defaultPadding_48,
                ),
                CustomIconButton(
                  text: FontAwesomeIcons.angleLeft,
                  backgroundColor: S.colors.background_2,
                  color: S.colors.primary,
                  onPressed: () {
                    NavigationService.goBack();
                  },
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: 10,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: S.dimens.defaultPadding_4,
                      mainAxisSpacing: S.dimens.defaultPadding_4,
                      childAspectRatio: 0.725,
                    ),
                    itemBuilder: (context, index) => Card(
                      elevation: 0.3,
                      color: S.colors.background_1,
                      child: Column(
                        children: [
                          SizedBox(
                            height: ScreenUtil().scaleHeight * 180,
                            child: Image.asset(R.images.homeToy_1),
                          ),
                          SizedBox(
                            height: S.dimens.defaultPadding_8,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: S.dimens.defaultPadding_4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: ScreenUtil().scaleWidth * 110,
                                  child: Text(
                                    "Helicoptersdsdsdádasdadasdassdsd",
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
                            padding: EdgeInsets.symmetric(
                                horizontal: S.dimens.defaultPadding_4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  FontAwesomeIcons.faceSmile,
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
                  ),
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
