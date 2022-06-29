import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/styles/styles.dart';

class ProfileSwapToyCard extends ConsumerWidget {
  const ProfileSwapToyCard({
    Key? key,
    required this.press,
    required this.itemImagePath,
    required this.itemName,
    required this.uuid,
  }) : super(key: key);
  final VoidCallback press;
  final String itemImagePath;
  final String itemName;
  final String uuid;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.defaultPadding_16,
          vertical: S.dimens.defaultPadding_8),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: S.colors.background_2,
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
