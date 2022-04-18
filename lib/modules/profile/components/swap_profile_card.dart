import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';

class SwapProductCard extends StatelessWidget {
  const SwapProductCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          SizedBox(
            child: Image.asset(R.images.logo),
            height: 60,
            width: 60,
          ),
          SizedBox(
            width: S.dimens.defaultPadding_8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phat Nguyen",
                style: S.textStyles.titleHeavy,
              ),
              RatingBarIndicator(
                rating: 2.5,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 5,
                itemSize: 24.0,
                direction: Axis.horizontal,
              ),
            ],
          )
        ],
      ),
    );
  }
}
