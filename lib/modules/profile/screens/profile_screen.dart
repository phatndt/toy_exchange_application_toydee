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
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomIconButton(
                  width: 50.0,
                  text: Icons.arrow_back_rounded,
                  onPressed: () {}),
              IconButton(
                  onPressed: () {},
                  iconSize: 40.0,
                  icon: Icon(
                    Icons.edit_note,
                    color: S.colors.primary,
                  )),
            ],
          ),
          ProfileWidget(imagePath: T.imageProfilePath, onPressed: () {}),
          const SizedBox(
            height: 10.0,
          ),
          Column(
            children: [
              Text(
                'Alababa',
                style: S.textStyles.h3,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(
                'email@alabaka.xaxa',
                style: S.textStyles.titleLightPrimary,
              )
            ],
          ),
          const SizedBox(
            height: 10.0,
          ),
          Container(
            child: TabBar(
              unselectedLabelColor: S.colors.gray_3,
              labelColor: S.colors.primary,
              labelStyle: S.textStyles.titleHeavy,
              indicatorColor: S.colors.primary,
              indicatorPadding: EdgeInsets.all(8.0),
              indicatorWeight: 2.5,
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Post',
                  // icon: Icon(
                  //   Icons.list,
                  //   color: S.colors.primary,
                  // ),
                ),
                Tab(
                  text: 'Review',
                  // icon: Icon(
                  //   Icons.reviews,
                  //   color: S.colors.primary,
                  // ),
                ),
                Tab(
                  text: 'Contact',
                  // icon: Icon(
                  //   Icons.mail,
                  //   color: S.colors.primary,
                  // ),
                )
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                  width: double.maxFinite,
                  height: MediaQuery.of(context).size.height,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ProfileTab1(
                        color: S.colors.primary,
                      ),
                      ProfileTab1(
                        color: Colors.greenAccent,
                      ),
                      ProfileTab1(
                        color: Colors.amber,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
