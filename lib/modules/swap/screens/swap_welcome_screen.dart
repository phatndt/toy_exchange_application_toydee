import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_icon_button.dart';
import 'package:toy_exchange_application_toydee/core/widgets/custom_text_elevated_button.dart';

import '../../../core/styles/resources.dart';
import '../../../core/styles/styles.dart';
import '../../../core/styles/text.dart';

class SwapWelcomeScreen extends StatelessWidget {
  const SwapWelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            header(),
            body(),
            const Expanded(child: SizedBox()),
            foooter(),
          ],
        ),
      ),
    );
  }

  Widget header() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_16),
        child: Column(
          children: [
            SizedBox(
              height: S.dimens.defaultPaddingVertical_48,
            ),
            CustomIconButton(
              text: FontAwesomeIcons.angleLeft,
              backgroundColor: S.colors.background_2,
              color: S.colors.primary,
              onPressed: () {
                NavigationService.goBack();
              },
            ),
          ],
        ),
      );

  Widget body() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
        child: Column(
          children: [
            SizedBox(
              height: S.dimens.defaultPaddingVertical_16,
            ),
            Align(
              alignment: Alignment.center,
              child: SizedBox(
                height: 350.h,
                child: Image.asset(
                  R.images.swapWelcome,
                ),
              ),
            ),
            Text(
              T.swapTitleWelcome,
              style: S.textStyles.h5,
            ),
            SizedBox(
              height: S.dimens.defaultPaddingVertical_16,
            ),
            Text(
              T.swapContentWelcome,
              style: S.textStyles.titleHeavy,
            ),
          ],
        ),
      );

  Widget foooter() => Padding(
        padding: EdgeInsets.symmetric(horizontal: S.dimens.defaultPadding_32),
        child: SizedBox(
          height: S.dimens.defaultPaddingVertical_88,
          child: Align(
            alignment: Alignment.topCenter,
            child: CustomButton(
              text: T.swapWelcomeButton,
              onPressed: () async {
                // NavigationService.push(
                //   page: RoutePaths.swapScreenMain,
                //   isNamed: true,
                // );
                // LocationPermission permission;

                // permission = await Geolocator.checkPermission();

                // if (permission == LocationPermission.denied) {
                //   permission = await Geolocator.requestPermission();
                //   if (permission == LocationPermission.denied) {
                //     return Future.error('Location Permissions are denied');
                //   }
                // }
                // Position position = await Geolocator.getCurrentPosition();
                // log('1');
                // List<Placemark> placemarks = await placemarkFromCoordinates(
                //     position.latitude, position.longitude);
                // Placemark place = placemarks[0];
                // log(place.toString());
                // log(place.thoroughfare! +
                //     place.locality! +
                //     place.administrativeArea! +
                //     place.country!);
                // log('2');
              },
            ),
          ),
        ),
      );
}
