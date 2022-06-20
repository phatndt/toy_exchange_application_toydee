import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/services/converter.dart';
import 'package:toy_exchange_application_toydee/core/styles/styles.dart';
import 'package:toy_exchange_application_toydee/core/widgets/Toast.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';
import 'package:toy_exchange_application_toydee/modules/home/view_models/home_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/profile/components/swap_profile_card.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/models/events_toy.dart';
import 'package:toy_exchange_application_toydee/modules/profile/events_screens/view_models/list_events_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/request/viewmodels/request_view_model.dart';

class EventsToyDetail extends ConsumerWidget {
  const EventsToyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    final future = ref.watch(eventToyProvider(args));
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: S.colors.background_2,
        body: future.when(
            data: (data) {
              return Column(
                children: [
                  SizedBox(
                    height: ScreenUtil().screenWidth - 20,
                    child: Stack(children: [
                      SizedBox(
                        child: Swiper(
                          itemCount: data!.image.length,
                          autoplay: true,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal:
                                      S.dimens.defaultPaddingVertical_4),
                              child: Container(
                                height: ScreenUtil().scaleHeight * 180,
                                decoration: BoxDecoration(
                                  color: S.colors.lavender,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(
                                        S.dimens.defaultBorderRadius),
                                  ),
                                  image: DecorationImage(
                                      image: NetworkImage(data.image[index]),
                                      fit: BoxFit.fill),
                                ),
                              ),
                            );
                          },
                          pagination: SwiperPagination(
                            alignment: Alignment.bottomCenter,
                            builder: DotSwiperPaginationBuilder(
                              activeColor: S.colors.primary,
                              color: S.colors.accent_5,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: S.dimens.defaultPadding_16),
                        child: Column(
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
                          ],
                        ),
                      ),
                    ]),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: S.colors.background_1,
                        borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(S.dimens.defaultBorderRadius),
                          topRight:
                              Radius.circular(S.dimens.defaultBorderRadius),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: S.dimens.defaultPadding_32),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            Text(
                              data.name,
                              style: S.textStyles.h3,
                            ),
                            SizedBox(
                              height: S.dimens.defaultPadding_8,
                            ),
                            ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: 80.h,
                              ),
                              child: Text(
                                data.description,
                                overflow: TextOverflow.ellipsis,
                                style: S.textStyles.titleLight,
                                maxLines: 4,
                              ),
                            ),
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            const SwapProductCard(),
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      data.toyType.condition == 0
                                          ? FontAwesomeIcons.faceGrin
                                          : FontAwesomeIcons.faceFrown,
                                      color: S.colors.primary,
                                    ),
                                    SizedBox(
                                      width: S.dimens.defaultPadding_8,
                                    ),
                                    Text(
                                      Converter.convertCondition(
                                          data.toyType.condition),
                                      style: S.textStyles.titleLight,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.child,
                                      color: S.colors.primary,
                                    ),
                                    SizedBox(
                                      width: S.dimens.defaultPadding_8,
                                    ),
                                    Text(
                                      Converter.convertGenderType(
                                          data.toyType.genderType),
                                      style: S.textStyles.titleLight,
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.magento,
                                      color: S.colors.primary,
                                    ),
                                    SizedBox(
                                      width: S.dimens.defaultPadding_8,
                                    ),
                                    Text(
                                      Converter.convertAgeGroup(
                                          data.toyType.ageGroup),
                                      style: S.textStyles.titleLight,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: S.dimens.defaultPadding_16,
                            ),
                            Row(
                              children: [
                                Icon(
                                  FontAwesomeIcons.typo3,
                                  color: S.colors.primary,
                                ),
                                SizedBox(
                                  width: S.dimens.defaultPadding_8,
                                ),
                                Expanded(
                                  child: Text(
                                    Converter.convertCategories(
                                        data.toyType.categories.toSet()),
                                    style: S.textStyles.titleLight,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )
                              ],
                            ),
                            const Expanded(
                              child: SizedBox(),
                            ),
                            // SizedBox(
                            //   height: S.dimens.defaultPadding_88,
                            //   child: Align(
                            //     alignment: Alignment.topCenter,
                            //     child: CustomButton(
                            //       text: "Request swap",
                            //       onPressed: () async {
                            //         final result = await ref
                            //             .watch(requestSettingNotifier.notifier)
                            //             .checkSwapToyOfUser(data.id, context);
                            //         if (result) {
                            //           CustomToast.fToast.init(context);
                            //           CustomToast.fToast.showToast(
                            //               gravity: ToastGravity.TOP,
                            //               child: const CustomToastBuilder(
                            //                   msg: "It is your toy!",
                            //                   icon: FontAwesomeIcons
                            //                       .exclamation));
                            //         } else {
                            //           showRequest(context, ref, data);
                            //         }
                            //       },
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
            error: (error, stack) => Text(""),
            loading: () => Text("")),
      ),
    );
  }

  // void showRequest(BuildContext buildContext, WidgetRef ref, EventsToy? swapToy) {
  //   showModalBottomSheet(
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(S.dimens.defaultBorderRadius),
  //       ),
  //     ),
  //     context: buildContext,
  //     builder: (context) {
  //       return SingleChildScrollView(
  //         controller: ModalScrollController.of(context),
  //         child: Column(
  //           children: [
  //             SizedBox(
  //               height: 400.h,
  //               child: ref.watch(requestSwapToyListProvider).when(
  //                   data: (data) {
  //                     return ListView.builder(
  //                       itemCount: data.docs.length,
  //                       itemBuilder: (context, index) {
  //                         EventsToy swapToy =
  //                             EventsToy.fromMap(data.docs[index].data());
  //                         return RequestSwapToyCard(
  //                           press: () {
  //                             ref
  //                                 .watch(requestSettingNotifier.notifier)
  //                                 .updateSelectedSwapToy(swapToy.id);

  //                             ref
  //                                 .watch(requestSettingNotifier.notifier)
  //                                 .updateSwapToyUser(swapToy.userId);
  //                           },
  //                           itemName: swapToy.name,
  //                           itemPrice: "",
  //                           itemDistance: "",
  //                           itemImagePath: swapToy.image.first,
  //                           index: swapToy.id,
  //                         );
  //                       },
  //                     );
  //                   },
  //                   error: (error, stack) => Center(
  //                       child: Lottie.network(
  //                           'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json')),
  //                   loading: () {
  //                     log("loading");
  //                     return const Center(
  //                       child: CircularProgressIndicator(),
  //                     );
  //                   }),
  //             ),
  //             Padding(
  //               padding: EdgeInsets.all(S.dimens.defaultPaddingVertical_16),
  //               child: CustomButton(
  //                   text: "Swap",
  //                   onPressed: () {
  //                     ref
  //                         .watch(requestSettingNotifier.notifier)
  //                         .addRequestToFirestore(
  //                           swapToy!.id,
  //                           swapToy.userId,
  //                           ref.watch(requestSettingNotifier).selectedSwapToy,
  //                           ref.watch(requestSettingNotifier).swapToyUser,
  //                           buildContext,
  //                         );
  //                     NavigationService.goBack();
  //                   }),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
}
