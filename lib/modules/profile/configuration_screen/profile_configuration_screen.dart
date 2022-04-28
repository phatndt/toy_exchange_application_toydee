import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_gender.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_names.dart';
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
  String email = '';
  String password = '';
  String showPassword = '******';
  String phone = '';
  String address = '';
  String gender = '0';
  List<String> names = ['1', '2'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: S.dimens.defaultPadding_48,
                child: Center(
                  child: Text(
                    T.proConScreenLabel,
                    style: S.textStyles.h5,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: S.dimens.defaultPadding_16,
                ),
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
              SizedBox(
                height: S.dimens.defaultPadding_8,
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.lock,
                label: T.proConLabelPassword,
                information: showPassword,
                press: () async {
                  final newPassword =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationTextChanging(
                      label: T.proConLabelPassword,
                      information: password,
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ));
                  setState(() {
                    password = newPassword;
                  });
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.user,
                label: T.proConLabelEmail,
                information: email,
                press: () async {
                  final newEmail =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationTextChanging(
                      label: T.proConLabelEmail,
                      information: email,
                      textInputType: TextInputType.emailAddress,
                    ),
                  ));

                  setState(() {
                    email = newEmail;
                  });
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.phone,
                label: T.proConLabelPhone,
                information: phone,
                press: () async {
                  final newPhone =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationTextChanging(
                      label: T.proConLabelPhone,
                      information: phone,
                      textInputType: TextInputType.phone,
                    ),
                  ));

                  setState(() {
                    phone = newPhone;
                  });
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.pencil,
                label: T.proConLabelName,
                information: names[0] + ' ' + names[1],
                press: () async {
                  final newNames =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationNamesChanging(
                      label1: T.proConLabelFirstName,
                      label2: T.proConLabelLastName,
                      information1: names[0] + ' ',
                      information2: names[1],
                      textInputType: TextInputType.name,
                      names: names,
                    ),
                  ));

                  setState(() {
                    names = newNames;
                  });
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.calendar,
                label: T.proConLabelBirth,
                information: _datetime,
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
                information: (gender),
                press: () async {
                  final newGender =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationGenderChanging(
                      label: T.proConLabelGender,
                      information: (gender),
                    ),
                  ));
                  // setState(() {
                  //   gender = newGender;
                  // });
                  switch (newGender) {
                    case 0:
                      setState(() {
                        gender = 'Male';
                      });
                      break;
                    case 1:
                      setState(() {
                        gender = 'Female';
                      });
                      break;
                    case 2:
                      setState(() {
                        gender = 'Other';
                      });
                      break;
                    default:
                      '';
                  }
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.locationDot,
                label: T.proConLabelAddress,
                information: address,
                press: () async {
                  final newAddress =
                      await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationTextChanging(
                      label: T.proConLabelAddress,
                      information: address,
                      textInputType: TextInputType.streetAddress,
                    ),
                  ));

                  setState(() {
                    address = newAddress;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
