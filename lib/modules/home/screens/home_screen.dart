import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_form_field.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_outline_button.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/tesst.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_text_elevated_button.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     List color = [S.colors.accent_8, S.colors.accent_4, S.colors.accent_5];
//     List text = [
//       "Donate unused toys or help with  funds for worthy causes",
//       "Exchange toy with other users easily and quickly",
//       "Social and special events in support of uor partners",
//     ];
//     List image = [
//       R.images.homeSwiper_1,
//       R.images.homeSwiper_2,
//       R.images.homeSwiper_3,
//     ];
//     TabController tabController = TabController(length: 2, vsync: this);
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: S.colors.background_1,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding:
//                 EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
//             child: Column(
//               children: [
//                 SizedBox(
//                   height: S.dimens.defaultPadding_8,
//                 ),
//                 Center(
//                   child: SizedBox(
//                     height: 40,
//                     width: 160,
//                     child: Image.asset(
//                       R.images.logoText,
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: S.dimens.defaultPadding_16,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CustomTextFormField(
//                       hintText: "Search",
//                       obscureText: true,
//                       controller: Tesst.e,
//                       width: ScreenUtil().setWidth(320),
//                     ),
//                     CustomIconButton(
//                       width: ScreenUtil().setWidth(50),
//                       text: R.images.fbLogin,
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: S.dimens.defaultPadding_16,
//                 ),
//                 SizedBox(
//                   height: 200.h,
//                   width: double.infinity,
//                   child: Swiper(
//                     itemBuilder: (BuildContext context, int index) {
//                       return Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: S.dimens.defaultPadding_4),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             color: color[index],
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(S.dimens.defaultBorderRadius),
//                             ),
//                           ),
//                           child: Padding(
//                             padding: EdgeInsets.all(S.dimens.defaultPadding_16),
//                             child: Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   flex: 3,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Text(
//                                         text[index],
//                                         style: S.textStyles.h4,
//                                       ),
//                                       InkWell(
//                                         onTap: () {},
//                                         child: Text(
//                                           "Learn more",
//                                           style: S.textStyles.h4Underline,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: S.dimens.defaultPadding_16,
//                                 ),
//                                 Expanded(
//                                     flex: 2,
//                                     child: Center(
//                                         child: Image.asset(image[index]))),
//                               ],
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                     itemCount: 3,
//                   ),
//                 ),
//                 Container(
//                   child: TabBar(
//                     tabs: [
//                       Tab(text: "Lastes"),
//                       Tab(text: "Lastes"),
//                     ],
//                   ),
//                 ),
//                 Container(
//                   child: TabBarView(children: [
//                     Text("Hi"),
//                     Text("There"),
//                   ]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List color = [S.colors.accent_8, S.colors.accent_4, S.colors.accent_5];
    List text = [
      "Donate unused toys or help with  funds for worthy causes",
      "Exchange toy with other users easily and quickly",
      "Social and special events in support of uor partners",
    ];
    List image = [
      R.images.homeSwiper_1,
      R.images.homeSwiper_2,
      R.images.homeSwiper_3,
    ];
    TabController tabController = TabController(length: 2, vsync: this);
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: S.colors.background_1,
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
              child: Column(
                children: [
                  SizedBox(
                    height: S.dimens.defaultPadding_8,
                  ),
                  Center(
                    child: SizedBox(
                      height: 40,
                      width: 160,
                      child: Image.asset(
                        R.images.logoText,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextFormField(
                        hintText: "Search",
                        obscureText: true,
                        controller: Tesst.e,
                        width: ScreenUtil().setWidth(320),
                      ),
                      CustomIconButton(
                        backgroundcolor: S.colors.accent_5,
                        width: ScreenUtil().setWidth(50),
                        text: FontAwesomeIcons.filter,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  SizedBox(
                    height: 200.h,
                    width: double.infinity,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: S.dimens.defaultPadding_4),
                          child: Container(
                            decoration: BoxDecoration(
                              color: color[index],
                              borderRadius: BorderRadius.all(
                                Radius.circular(S.dimens.defaultBorderRadius),
                              ),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsets.all(S.dimens.defaultPadding_16),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          text[index],
                                          style: S.textStyles.h4,
                                        ),
                                        InkWell(
                                          onTap: () {},
                                          child: Text(
                                            "Learn more",
                                            style: S.textStyles.h4Underline,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: S.dimens.defaultPadding_16,
                                  ),
                                  Expanded(
                                      flex: 2,
                                      child: Center(
                                          child: Image.asset(image[index]))),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: 3,
                    ),
                  ),
                  SizedBox(
                    height: S.dimens.defaultPadding_16,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: TabBar(
                      indicator: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: S.colors.accent_1,
                            width: 2.0,
                          ),
                        ),
                      ),
                      labelColor: S.colors.accent_1,
                      unselectedLabelColor: S.colors.primary,
                      tabs: [
                        Tab(
                          child: Text(
                            "Latest",
                            style: S.textStyles.h4,
                          ),
                        ),
                        Tab(
                          child: Text(
                            "Swap",
                            style: S.textStyles.h4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   padding: const EdgeInsets.only(left: 20),
                  //   width: double.infinity,
                  //   height: 300.h,
                  //   child: TabBarView(controller: tabController, children: [
                  //     Text("Hi"),
                  //     Text("There"),
                  //   ]),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
