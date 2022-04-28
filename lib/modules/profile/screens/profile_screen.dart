import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';

import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

import '../components/profile_widget.dart';
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
          Padding(
            padding: EdgeInsets.only(
              top: S.dimens.defaultPadding_48,
              left: S.dimens.defaultPadding_16,
              right: S.dimens.defaultPadding_16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                    backgroundColor: S.colors.accent_5,
                    color: S.colors.primary,
                    width: 50.0,
                    text: Icons.arrow_back_rounded,
                    onPressed: () {}),
                CustomIconButton(
                  text: FontAwesomeIcons.gear,
                  onPressed: () {
                    NavigationService.push(
                      isNamed: true,
                      page: RoutePaths.profileconfiguration,
                    );
                  },
                  backgroundColor: S.colors.accent_5,
                  color: S.colors.primary,
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
          ),
          ProfileWidget(imagePath: T.imageProfilePath, onPressed: () {}),
          SizedBox(
            height: S.dimens.defaultPadding_8,
          ),
          Column(
            children: [
              Text(
                T.profileTextName,
                style: S.textStyles.h3,
              ),
              SizedBox(
                height: S.dimens.defaultPadding_4,
              ),
              Text(
                T.profileTextEmail,
                style: S.textStyles.titleLight,
              )
            ],
          ),
          SizedBox(
            height: S.dimens.defaultPadding_8,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: S.dimens.defaultPadding_16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomIconButton(
                  text: FontAwesomeIcons.envelope,
                  onPressed: () {},
                  color: S.colors.primary,
                  backgroundColor: S.colors.accent_5,
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
                      SizedBox(
                        width: 10,
                      ),
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
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                ),
                CustomIconButton(
                  text: Icons.phone,
                  onPressed: () {},
                  color: S.colors.primary,
                  backgroundColor: S.colors.accent_5,
                ),
              ],
            ),
          ),
          Container(
            child: TabBar(
              unselectedLabelColor: S.colors.gray_3,
              unselectedLabelStyle: S.textStyles.titleHeavy,
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
