import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';

import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';
import '../profile_widget.dart';
import '../profile_wiget2.dart';
import 'profile_tab_1.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return SafeArea(
        child: Scaffold(
      backgroundColor: S.colors.background_2,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomIconButton(
                    backgroundcolor: S.colors.primary,
                    color: S.colors.textColor_1,
                    width: 50.0,
                    text: Icons.arrow_back_rounded,
                    onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomIconButton(
                  text: Icons.edit_note,
                  onPressed: () {},
                  backgroundcolor: S.colors.primary,
                  color: S.colors.textColor_1,
                ),
              ),
              // IconButton(
              //   onPressed: () {},
              //   iconSize: 40.0,
              //   icon: Icon(
              //     Icons.edit_note,
              //     color: S.colors.primary,
              //   ),
              // ),
            ],
          ),
          ProfileWidget(imagePath: T.imageProfilePath, onPressed: () {}),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              Text(
                T.profileTextName,
                style: S.textStyles.h3,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                T.profileTextEmail,
                style: S.textStyles.titleLight,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomIconButton(
                  text: Icons.mail,
                  onPressed: () {},
                  color: S.colors.textColor_1,
                  backgroundcolor: S.colors.primary,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(S.dimens.defaultPadding_8)),
                  color: S.colors.primary,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ReviewWidget(
                      name: T.profileRating,
                      point: '5',
                    ),
                    ReviewWidget(
                      name: T.profileSwap,
                      point: '18',
                    ),
                    ReviewWidget(
                      name: T.profileDonated,
                      point: '22',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: CustomIconButton(
                  text: Icons.phone,
                  onPressed: () {},
                  color: S.colors.textColor_1,
                  backgroundcolor: S.colors.primary,
                ),
              ),
            ],
          ),
          Container(
            child: TabBar(
              unselectedLabelColor: S.colors.gray_3,
              labelColor: S.colors.primary,
              labelStyle: S.textStyles.titleHeavy,
              indicatorColor: S.colors.primary,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorPadding: EdgeInsets.all(8.0),
              indicatorWeight: 2.5,
              controller: _tabController,
              tabs: [
                Tab(
                  text: T.profileTabText1,
                ),
                Tab(
                  text: T.profileTabText2,
                  // icon: Icon(
                  //   Icons.reviews,
                  //   color: S.colors.primary,
                  // ),
                ),
                Tab(
                  text: T.profileTabText3,
                  // icon: Icon(
                  //   Icons.mail,
                  //   color: S.colors.primary,
                  // ),
                )
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                ProfileTab1(),
                ProfileTab1(),
                ProfileTab1(),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({
    Key? key,
    required this.name,
    required this.point,
  }) : super(key: key);

  final String name;
  final String point;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: S.dimens.defaultPadding_8,
          vertical: S.dimens.defaultPadding_4),
      child: Column(
        children: [
          Text(
            name,
            style: S.textStyles.titleLight,
          ),
          RichText(
              text: TextSpan(
            style: S.textStyles.titleHeavy,
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.star,
                  color: S.colors.textColor_1,
                ),
              ),
              TextSpan(text: point, style: S.textStyles.titleLight),
            ],
          ))
        ],
      ),
    );
  }
}
