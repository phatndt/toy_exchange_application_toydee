import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_gender.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_text.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_item.dart';

import 'package:intl/intl.dart';
import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class ProfileConfigurationScreen extends StatefulWidget {
  const ProfileConfigurationScreen({Key? key}) : super(key: key);

  @override
  State<ProfileConfigurationScreen> createState() =>
      _ProfileConfigurationScreenState();
}

class _ProfileConfigurationScreenState
    extends State<ProfileConfigurationScreen> {
  String _datetime = DateFormat('dd/MM/yyyy').format(DateTime.now());
  DateTime dateTime = DateTime.now();
  String gender = '...';
  String name = T.proConLabelNameEx;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: S.dimens.defaultPadding_16),
              child: Center(
                child: Text(
                  T.proConScreenLabel,
                  style: S.textStyles.h5,
                ),
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: CustomIconButton(
                text: FontAwesomeIcons.angleLeft,
                color: S.colors.primary,
                onPressed: () {
                  NavigationService.pushReplacement(
                      isNamed: true, page: RoutePaths.profile);
                },
                backgroundColor: S.colors.accent_5,
              ),
            ),
            ProfileConfigurationItem(
              icon: FontAwesomeIcons.user,
              label: T.proConLabelName,
              information: '$name',
              press: () async {
                final newName =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileConfigurationTextChanging(
                    label: T.proConLabelName,
                    information: T.proConLabelNameEx,
                  ),
                ));

                setState(() {
                  this.name = newName;
                });
              },
            ),
            ProfileConfigurationItem(
              icon: FontAwesomeIcons.lock,
              label: T.proConLabelPassword,
              information: T.proConLabelPasswordEx,
              press: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileConfigurationTextChanging(
                    label: T.proConLabelPassword,
                    information: T.proConLabelPasswordEx,
                  ),
                ));
              },
            ),
            ProfileConfigurationItem(
              icon: FontAwesomeIcons.calendar,
              label: T.proConLabelBirth,
              information: '$_datetime',
              press: () async {
                DateTime? newDateTime = await showDatePicker(
                  context: context,
                  initialDate: dateTime,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2023),
                );
                // Cancel
                if (newDateTime == null) return;
                // OK
                setState(() {
                  _datetime = DateFormat('dd/MM/yyyy').format(newDateTime);
                });
              },
            ),
            ProfileConfigurationItem(
              icon: FontAwesomeIcons.venusMars,
              label: T.proConLabelGender,
              information: '$gender',
              press: () async {
                final newGender =
                    await Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProfileConfigurationGenderChanging(
                    label: T.proConLabelGender,
                  ),
                ));
                setState(() {
                  this.gender = newGender;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
