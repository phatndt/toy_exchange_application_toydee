import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../profile_item_card.dart';
import '../list_post.dart';

class ProfileTab1 extends StatelessWidget {
  const ProfileTab1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      color: S.colors.gray_4,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: listpost.length,
        shrinkWrap: true,
        itemBuilder: (Context, index) {
          return ProfileItemCard(
            press: () {},
            itemName: listpost[index].name,
            itemDistance: listpost[index].distance,
            itemImagePath: listpost[index].imagepath,
            itemPrice: listpost[index].price,
          );
        },
      ),
    );
  }
}
