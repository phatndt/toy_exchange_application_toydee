import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/modules/home/view_models/home_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/widgets/custom_icon_button.dart';
import '../components/swap_top_item.dart';

class HomeAllToyScreen extends ConsumerWidget {
  const HomeAllToyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    child: RefreshIndicator(
                  onRefresh: () async => ref.refresh(allSwapToysProvider),
                  child: ref.watch(allSwapToysProvider).when(
                        data: (data) {
                          return GridView.builder(
                            itemCount: data.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: S.dimens.defaultPadding_4,
                              mainAxisSpacing: S.dimens.defaultPadding_4,
                              childAspectRatio: 0.725,
                            ),
                            itemBuilder: (context, index) => SwapToyCard(
                              name: data[index].name,
                              condition: data[index].toyType.condition,
                              showingImage: data[index].image.first,
                              uid: data[index].id,
                            ),
                          );
                        },
                        error: (error, stack) => Center(
                            child: Lottie.network(
                                'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json')),
                        loading: () =>
                            const Center(child: CircularProgressIndicator()),
                      ),
                )),
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
