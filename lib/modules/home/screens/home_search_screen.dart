import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/modules/home/viewmodels/home_search_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/home/view_models/home_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../../../core/widgets/custom_text_form_field.dart';
import '../../authentication/viewmodels/tesst.dart';
import '../../swap/models/toy_type.dart';
import '../components/swap_top_item.dart';

class HomeSearchScreen extends ConsumerWidget {
  const HomeSearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        controller: ref
                            .watch(homeSearchSettingNotifier)
                            .searchController,
                        width: ScreenUtil().setWidth(320),
                        autofocus: true,
                        focusNode: Tesst.myFocusNode,
                        onChanged: (value) {},
                        onFieldSubmitted: (value) {
                          ref
                              .watch(homeSettingNotifier.notifier)
                              .updateSearch(value);
                        },
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
                        ref
                            .watch(homeSearchSettingNotifier.notifier)
                            .clearSearchController();
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
                  child: ref
                      .watch(
                          searchProvider(ref.watch(homeSettingNotifier).search))
                      .when(
                        data: (data) {
                          log(ref.watch(homeSettingNotifier).search);
                          return GridView.builder(
                            itemCount: data.size,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: S.dimens.defaultPadding_4,
                              mainAxisSpacing: S.dimens.defaultPadding_4,
                              childAspectRatio: 0.725,
                            ),
                            itemBuilder: (context, index) {
                              DocumentSnapshot doc = data.docs[index];
                              return SwapToyCard(
                                name: doc['name'],
                                condition:
                                    ToyType.fromMap(doc['toyType']).condition,
                                showingImage:
                                    List<String>.from(doc['image']).first,
                                uid: doc['id'],
                              );
                            },
                          );
                        },
                        error: (error, stack) => Center(
                          child: Lottie.network(
                              'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                        ),
                        loading: () => const Center(
                          child: CircularProgressIndicator(),
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
