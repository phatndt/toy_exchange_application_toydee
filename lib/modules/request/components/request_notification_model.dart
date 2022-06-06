import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

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
            ref.watch(swapToyProvider(request.requestedSwapToyId)).when(
                  data: (data) {
                    return Container(
                      height: 110.h,
                      width: 110.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data!.image.first),
                        ),
                      ),
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
                          onPressed: () {},
                          child: const Icon(FontAwesomeIcons.xmark),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            shape: const CircleBorder(),
                          ),
                          onPressed: () {},
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
                    return Container(
                      height: 110.h,
                      width: 110.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(data!.image.first),
                        ),
                      ),
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
    );
  }
}
