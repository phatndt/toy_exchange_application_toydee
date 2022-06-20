import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/repos/chatting_repo.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/viewmodels/chatting_view_model.dart';
import 'package:toy_exchange_application_toydee/modules/request/repos/request_repo.dart';
import 'package:toy_exchange_application_toydee/modules/request/viewmodels/request_view_model.dart';

import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../../home/view_models/home_view_model.dart';
import '../model/request.dart';

class RequestNotificationCard extends ConsumerWidget {
  const RequestNotificationCard({
    Key? key,
    required this.request,
  }) : super(key: key);
  final Request request;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
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
          child: InkWell(
            onTap: () {
              NavigationService.push(
                page: RoutePaths.requestToyScreen,
                isNamed: true,
                arguments: request.requestingSwapToyId,
              );
            },
            child: Row(
              children: [
                ref.watch(swapToyProvider(request.requestedSwapToyId)).when(
                      data: (data) {
                        return Column(
                          children: [
                            Container(
                              height: 110.h,
                              width: 110.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data!.image.first),
                                ),
                              ),
                            ),
                            Text(
                              data.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
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
                Expanded(
                  child: request.status == 'waiting'
                      ? Row(
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: const CircleBorder(),
                                onPrimary: S.colors.primary,
                                primary: S.colors.background_1,
                              ),
                              onPressed: () {
                                ref
                                    .watch(requestSettingNotifier.notifier)
                                    .updateDeclineRequest(request.id);
                              },
                              child: const Icon(FontAwesomeIcons.xmark),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {
                                ref
                                    .watch(requestSettingNotifier.notifier)
                                    .updateAcceptRequest(
                                      request.id,
                                      request.requestingSwapToyId,
                                      request.requestedSwapToyId,
                                    );
                                ref
                                    .watch(chattingSettingNotifier.notifier)
                                    .createChatting(request);
                              },
                              child: const Icon(FontAwesomeIcons.check),
                            )
                          ],
                        )
                      : ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const CircleBorder(),
                            primary: request.status == 'accept'
                                ? S.colors.primary
                                : S.colors.background_1,
                            onPrimary: request.status == 'accept'
                                ? null
                                : S.colors.primary,
                            onSurface: Colors.transparent,
                          ),
                          onPressed: () {},
                          child: Icon(
                            request.status == 'accept'
                                ? FontAwesomeIcons.checkDouble
                                : FontAwesomeIcons.xmark,
                          ),
                        ),
                ),
                ref.watch(swapToyProvider(request.requestingSwapToyId)).when(
                      data: (data) {
                        return Column(
                          children: [
                            Container(
                              height: 110.h,
                              width: 110.h,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(data!.image.first),
                                ),
                              ),
                            ),
                            Text(
                              data.name,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
