import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_gender.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_names.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_password.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_changing_text.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/profile_configuration_item.dart';

import 'package:intl/intl.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/changing_names_view_models.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/changing_password_view_models.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/changing_text_view_models.dart';
import 'package:toy_exchange_application_toydee/modules/profile/configuration_screen/viewmodels/configuration_view_models.dart';
import '../../../core/routing/navigation_service.dart';
import '../../../core/routing/route_paths.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class ProfileConfigurationScreen extends ConsumerWidget {
  ProfileConfigurationScreen({Key? key}) : super(key: key);

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
  Widget build(BuildContext context, WidgetRef ref) {
    ref
        .watch(configurationNotifierProvider.notifier)
        .getFirstNameFromFireStore();
    ref
        .watch(configurationNotifierProvider.notifier)
        .getLastNameFromFireStore();
    ref
        .watch(configurationNotifierProvider.notifier)
        .getBirthDateFromFireStore();
    ref.watch(configurationNotifierProvider.notifier).getGenderFromFireStore();
    ref.watch(configurationNotifierProvider.notifier).getPhoneFromFireStore();
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
                    NavigationService.goBack();
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
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationPasswordChanging(
                      label1: T.proConLabelOldPassword,
                      label2: T.proConLabelOldPasswordConfirm,
                      label3: T.proConLabelNewPassword,
                      oldPassword: '',
                      oldPasswordConfirm: '',
                      newPassword: '',
                      textInputType: TextInputType.visiblePassword,
                      backPress: ref
                          .watch(configurationChangingPasswordNotifierProvider
                              .notifier)
                          .navigationBack,
                      savePress: ref
                          .watch(configurationChangingPasswordNotifierProvider
                              .notifier)
                          .saveChanges,
                      oldPasswordClearPress: ref
                          .watch(configurationChangingPasswordNotifierProvider
                              .notifier)
                          .oldPassClear,
                      oldPasswordConfirmClearPress: ref
                          .watch(configurationChangingPasswordNotifierProvider
                              .notifier)
                          .oldPassConfirmClear,
                      newPasswordClearPress: ref
                          .watch(configurationChangingPasswordNotifierProvider
                              .notifier)
                          .newPassClear,
                      oldPasswordEditingController: ref
                          .watch(configurationChangingPasswordNotifierProvider)
                          .oldPasswordEdittingController,
                      oldPasswordConfirmEditingController: ref
                          .watch(configurationChangingPasswordNotifierProvider)
                          .oldPasswordConfirmEdittingController,
                      newPasswordEditingController: ref
                          .watch(configurationChangingPasswordNotifierProvider)
                          .newPasswordEditingController,
                    ),
                  ));
                },
              ),
              // ProfileConfigurationItem(
              //   icon: FontAwesomeIcons.user,
              //   label: T.proConLabelEmail,
              //   information: ref.watch(configurationNotifierProvider).email,
              //   press: () {
              //     Navigator.of(context).push(MaterialPageRoute(
              //       builder: (context) => ProfileConfigurationTextChanging(
              //         label: T.proConLabelEmail,
              //         information:
              //             ref.watch(configurationNotifierProvider).email,
              //         textInputType: TextInputType.emailAddress,
              //         backPress: ref
              //             .watch(configurationChangingTextNotifierProvider
              //                 .notifier)
              //             .navigationBackEmail,
              //         savePress: ref
              //             .watch(configurationChangingTextNotifierProvider
              //                 .notifier)
              //             .saveChangesEmail,
              //         clearPress: ref
              //             .watch(configurationChangingTextNotifierProvider
              //                 .notifier)
              //             .clearTextEmail,
              //         textEditingController: ref
              //             .watch(configurationChangingTextNotifierProvider)
              //             .emailEditingController,
              //       ),
              //     ));
              //   },
              // ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.phone,
                label: T.proConLabelPhone,
                information: ref.watch(configurationNotifierProvider).phone,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationTextChanging(
                      label: T.proConLabelPhone,
                      information:
                          ref.watch(configurationNotifierProvider).phone,
                      textInputType: TextInputType.phone,
                      backPress: ref
                          .watch(configurationChangingTextNotifierProvider
                              .notifier)
                          .navigationBackPhone,
                      savePress: ref
                          .watch(configurationChangingTextNotifierProvider
                              .notifier)
                          .saveChangesPhone,
                      clearPress: ref
                          .watch(configurationChangingTextNotifierProvider
                              .notifier)
                          .clearTextPhone,
                      textEditingController: ref
                          .watch(configurationChangingTextNotifierProvider)
                          .phoneEditingController,
                    ),
                  ));
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.pencil,
                label: T.proConLabelName,
                information:
                    ref.watch(configurationNotifierProvider).firstname +
                        ' ' +
                        ref.watch(configurationNotifierProvider).lastname,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationNamesChanging(
                      label1: T.proConLabelFirstName,
                      label2: T.proConLabelLastName,
                      firstName:
                          ref.watch(configurationNotifierProvider).firstname,
                      lastName:
                          ref.watch(configurationNotifierProvider).lastname,
                      information1:
                          ref.watch(configurationNotifierProvider).firstname +
                              ' ',
                      information2:
                          ref.watch(configurationNotifierProvider).lastname,
                      textInputType: TextInputType.name,
                      firstNameController: ref
                          .watch(configurationChangingNamesNotifierProvider)
                          .firstNameEditingController,
                      lastNameController: ref
                          .watch(configurationChangingNamesNotifierProvider)
                          .lastNameEditingController,
                    ),
                  ));
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.calendar,
                label: T.proConLabelBirth,
                information: ref.watch(configurationNotifierProvider).datetime,
                press: () {
                  showDatePicker(
                    context: context,
                    initialDate: dateTime,
                    firstDate: DateTime(2021),
                    lastDate: DateTime(2023),
                  ).then((value) {
                    if (value != null) {
                      ref.watch(configurationNotifierProvider).datetime =
                          DateFormat('dd/MM/yyyy').format(value);
                      ref
                          .watch(configurationNotifierProvider.notifier)
                          .updateDate(DateFormat('dd/MM/yyyy').format(value));
                      ref
                          .watch(configurationNotifierProvider.notifier)
                          .datetoFireStore(
                              DateFormat('dd/MM/yyyy').format(value));
                    }
                  });
                  // Cancel
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.venusMars,
                label: T.proConLabelGender,
                information: ref.watch(configurationNotifierProvider).gender,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationGenderChanging(
                      label: T.proConLabelGender,
                      information:
                          ref.watch(configurationNotifierProvider).gender,
                    ),
                  ));
                },
              ),
              ProfileConfigurationItem(
                icon: FontAwesomeIcons.locationDot,
                label: T.proConLabelAddress,
                information: ref.watch(configurationNotifierProvider).address,
                press: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProfileConfigurationTextChanging(
                      label: T.proConLabelAddress,
                      information: address,
                      textInputType: TextInputType.streetAddress,
                      backPress: ref
                          .watch(configurationChangingTextNotifierProvider
                              .notifier)
                          .navigationBackAddress,
                      savePress: ref
                          .watch(configurationChangingTextNotifierProvider
                              .notifier)
                          .saveChangesAddress,
                      clearPress: ref
                          .watch(configurationChangingTextNotifierProvider
                              .notifier)
                          .clearTextAddress,
                      textEditingController: ref
                          .watch(configurationChangingTextNotifierProvider)
                          .addressEditingController,
                    ),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
