import 'dart:developer';

import 'package:card_swiper/card_swiper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_form_field.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/viewmodels/tesst.dart';
import 'package:toy_exchange_application_toydee/modules/home/repos/home_repo.dart';
import 'package:toy_exchange_application_toydee/modules/home/view_models/home_view_model.dart';

import '../../../core/styles/styles.dart';
import '../../swap/models/toy_type.dart';
import '../components/swap_top_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List color = [S.colors.accent_4, S.colors.accent_5, S.colors.accent_8];
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
    if (MediaQuery.of(context).viewInsets.bottom == 0) {
      myFocusNode.unfocus();
    }

    return GestureDetector(
      onTap: (() {
        myFocusNode.unfocus();
      }),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: S.colors.background_2,
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: S.colors.background_1,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(S.dimens.defaultPadding_24),
                      bottomRight: Radius.circular(S.dimens.defaultPadding_24),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_16),
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
                            Expanded(
                              child: CustomTextFormField(
                                hintText: "Search",
                                obscureText: true,
                                controller: Tesst.g,
                                width: ScreenUtil().setWidth(320),
                                focusNode: myFocusNode,
                                onTap: () {
                                  NavigationService.push(
                                    page: RoutePaths.searchScreen,
                                    isNamed: true,
                                  );
                                },
                                readOnly: true,
                              ),
                            ),
                            SizedBox(
                              width: S.dimens.defaultPadding_8,
                            ),
                            CustomIconButton(
                              width: 50,
                              text: FontAwesomeIcons.filter,
                              backgroundColor: S.colors.accent_5,
                              onPressed: () {
                                NavigationService.push(
                                    isNamed: true, page: RoutePaths.homefilter);
                              },
                              color: S.colors.primary,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: S.dimens.defaultPadding_16,
                        ),
                        SizedBox(
                          height: 165.h,
                          width: double.infinity,
                          child: Swiper(
                            autoplay: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: EdgeInsets.only(
                                    right: S.dimens.defaultBorderRadius / 2),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: color[index],
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(
                                          S.dimens.defaultBorderRadius),
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        S.dimens.defaultPadding_16),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width: ScreenUtil().scaleWidth *
                                                    200,
                                                child: Text(
                                                  text[index],
                                                  style: S.textStyles.h4,
                                                ),
                                              ),
                                              // InkWell(
                                              //   onTap: () {},
                                              //   child: Text(
                                              //     "Learn more",
                                              //     style: S.textStyles
                                              //         .titleLightUnderline,
                                              //   ),
                                              // ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                            flex: 2,
                                            child: Center(
                                                child:
                                                    Image.asset(image[index]))),
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
                            controller: tabController,
                            indicator: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: S.colors.accent_1,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            indicatorSize: TabBarIndicatorSize.label,
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
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: S.dimens.defaultPadding_8,
                ),
                Align(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: S.dimens.defaultPadding_16,
                    ),
                    child: InkWell(
                      onTap: () {
                        NavigationService.push(
                          page: RoutePaths.seeAllToy,
                          isNamed: true,
                        );
                      },
                      child: Text(
                        "See all",
                        style: S.textStyles.titleLightPrimary,
                      ),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: S.dimens.defaultPadding_16,
                        vertical: S.dimens.defaultPadding_4),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            var future = ref.watch(latestSwapToysProvider);
                            return RefreshIndicator(
                              onRefresh: () async {
                                future = ref.refresh(latestSwapToysProvider);
                              },
                              child: future.when(
                                data: (data) {
                                  return GridView.builder(
                                    itemCount: data.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing:
                                          S.dimens.defaultPadding_4,
                                      mainAxisSpacing:
                                          S.dimens.defaultPadding_4,
                                      childAspectRatio: 0.725,
                                    ),
                                    itemBuilder: (context, index) =>
                                        SwapToyCard(
                                      name: data[index].name,
                                      condition: data[index].toyType.condition,
                                      showingImage: data[index].image.first,
                                      uid: data[index].id,
                                    ),
                                  );
                                },
                                error: (e, stack) {
                                  return Center(
                                    child: LottieBuilder.network(
                                        'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                                  );
                                },
                                loading: () => Center(
                                  child: CircularProgressIndicator(
                                    color: S.colors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        Consumer(
                          builder: (BuildContext context, WidgetRef ref,
                              Widget? child) {
                            var future = ref.watch(swapToysProvider);
                            return RefreshIndicator(
                              onRefresh: () async {
                                future = ref.refresh(swapToysProvider);
                              },
                              child: future.when(
                                data: (data) {
                                  return GridView.builder(
                                    itemCount: data.length,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing:
                                          S.dimens.defaultPadding_4,
                                      mainAxisSpacing:
                                          S.dimens.defaultPadding_4,
                                      childAspectRatio: 0.725,
                                    ),
                                    itemBuilder: (context, index) =>
                                        SwapToyCard(
                                      name: data[index].name,
                                      condition: data[index].toyType.condition,
                                      showingImage: data[index].image.first,
                                      uid: data[index].id,
                                    ),
                                  );
                                },
                                error: (e, stack) {
                                  return Center(
                                    child: LottieBuilder.network(
                                        'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                                  );
                                },
                                loading: () => Center(
                                  child: CircularProgressIndicator(
                                    color: S.colors.primary,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
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

//  Consumer(
//                           builder: (BuildContext context, WidgetRef ref,
//                               Widget? child) {
//                             var future = ref.watch(swapToysStreamProvider);
//                             return RefreshIndicator(
//                                 onRefresh: () async {},
//                                 child: future.when(
//                                     data: (data) {
//                                       return GridView.builder(
//                                         itemCount: data.size,
//                                         gridDelegate:
//                                             SliverGridDelegateWithFixedCrossAxisCount(
//                                           crossAxisCount: 2,
//                                           crossAxisSpacing:
//                                               S.dimens.defaultPadding_4,
//                                           mainAxisSpacing:
//                                               S.dimens.defaultPadding_4,
//                                           childAspectRatio: 0.725,
//                                         ),
//                                         itemBuilder: (context, index) {
//                                           DocumentSnapshot doc =
//                                               data.docs[index];
//                                           return SwapToyCard(
//                                             name: doc['name'],
//                                             condition:
//                                                 ToyType.fromMap(doc['toyType'])
//                                                     .condition,
//                                             showingImage:
//                                                 List<String>.from(doc['image'])
//                                                     .first,
//                                           );
//                                         },
//                                       );
//                                     },
//                                     error: (e, stack) {
//                                       return Center(
//                                           child: Lottie.network(
//                                               'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'));
//                                     },
//                                     loading: () =>
//                                         const CircularProgressIndicator()));
//                           },
//                         ),
