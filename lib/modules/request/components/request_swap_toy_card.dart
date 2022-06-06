import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/modules/request/viewmodels/request_view_model.dart';

import '../../../core/styles/styles.dart';

class RequestSwapToyCard extends ConsumerWidget {
  const RequestSwapToyCard({
    Key? key,
    required this.press,
    required this.itemName,
    required this.itemPrice,
    required this.itemDistance,
    required this.itemImagePath,
    required this.index,
  }) : super(key: key);

  final VoidCallback press;
  final String itemImagePath;
  final String itemName, itemPrice, itemDistance;
  final String index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.defaultPadding_16,
          vertical: S.dimens.defaultPadding_8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor:
              ref.watch(requestSettingNotifier).selectedSwapToy == index
                  ? S.colors.background_1
                  : S.colors.background_2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(S.dimens.defaultPadding_8)),
        ),
        onPressed: press,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: S.dimens.defaultPadding_8),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(S.dimens.defaultPadding_16),
                child: Image.network(
                  itemImagePath,
                  height: 100,
                  width: 140,
                ),
              ),
              SizedBox(
                width: S.dimens.defaultPadding_8,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: S.textStyles.titleHeavyPrimary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
