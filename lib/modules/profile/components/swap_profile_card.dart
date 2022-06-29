import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/modules/authentication/repos/user_repo.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class SwapProductCard extends ConsumerWidget {
  const SwapProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(S.dimens.defaultBorderRadius),
              ),
              image: DecorationImage(image: NetworkImage(T.imageProfilePath)),
            ),
            height: 60,
            width: 60,
          ),
          SizedBox(
            width: S.dimens.defaultPadding_8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ref.watch(userRepoProvider).userModel!.lastName! +
                    " " +
                    ref.watch(userRepoProvider).userModel!.lastName!,
                style: S.textStyles.titleHeavy,
              ),
              const Text(""),
              // RatingBarIndicator(
              //   rating: 2.5,
              //   itemBuilder: (context, index) => const Icon(
              //     Icons.star,
              //     color: Colors.amber,
              //   ),
              //   itemCount: 5,
              //   itemSize: 24.0,
              //   direction: Axis.horizontal,
              // ),
            ],
          )
        ],
      ),
    );
  }
}
