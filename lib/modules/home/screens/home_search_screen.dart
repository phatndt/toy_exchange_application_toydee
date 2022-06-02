import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../authentication/viewmodels/tesst.dart';

class HomeSearchScreen extends StatelessWidget {
  const HomeSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      Tesst.myFocusNode.unfocus();
    }
    return GestureDetector(
      onTap: () {
        Tesst.myFocusNode.unfocus();
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
            child: Column(
              children: [
                SizedBox(
                  height: S.dimens.defaultPadding_48,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: CustomTextFormField(
                        hintText: "Search",
                        obscureText: false,
                        controller: Tesst.g,
                        width: ScreenUtil().setWidth(320),
                        autofocus: true,
                        focusNode: Tesst.myFocusNode,
                        onTap: () {},
                      ),
                    ),
                    SizedBox(
                      width: S.dimens.defaultPadding_8,
                    ),
                    CustomIconButton(
                      width: 50,
                      text: FontAwesomeIcons.arrowLeft,
                      backgroundColor: S.colors.accent_5,
                      onPressed: () {
                        NavigationService.goBack();
                      },
                      color: S.colors.primary,
                    ),
                  ],
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_16,
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
                          );
                        },
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
