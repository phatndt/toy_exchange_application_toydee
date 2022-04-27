import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/single_child_widget.dart';

import '../../../core/styles/styles.dart';

class ProfileItemCard extends StatelessWidget {
  const ProfileItemCard({
    Key? key,
    required this.press,
    required this.itemName,
    required this.itemPrice,
    required this.itemDistance,
    required this.itemImagePath,
  }) : super(key: key);

  final VoidCallback press;
  final String itemImagePath;
  final String itemName, itemPrice, itemDistance;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.defaultPadding_16,
          vertical: S.dimens.defaultPadding_4),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: S.colors.background_2,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(S.dimens.defaultPadding_8)),
          side: BorderSide(width: 0.1, color: S.colors.primary),
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
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      itemName,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: S.textStyles.titleHeavyPrimary,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LikeButton(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          size: 30,
                          likeBuilder: (bool isLiked) {
                            return Icon(
                              Icons.favorite,
                              color:
                                  isLiked ? S.colors.primary : S.colors.gray_3,
                              size: 30,
                            );
                          },
                          bubblesColor: BubblesColor(
                              dotPrimaryColor: S.colors.primary,
                              dotSecondaryColor: S.colors.primary),
                          circleColor: CircleColor(
                            start: S.colors.primary,
                            end: S.colors.primary,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              child: Text(
                                r'$' + itemPrice,
                                style: S.textStyles.titleLight,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            Expanded(
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.place,
                                      size: 20,
                                      color: S.colors.primary,
                                    ),
                                    Text(
                                      itemDistance + 'km',
                                      style: S.textStyles.titleLight,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
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
