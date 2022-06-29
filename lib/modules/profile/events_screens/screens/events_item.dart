import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/styles/styles.dart';

class EventsItem extends StatelessWidget {
  const EventsItem({
    Key? key,
    required this.eventName,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.onPress,
    required this.userId,
    required this.eventId,
  }) : super(key: key);

  final String eventName;
  final String startDate;
  final String endDate;
  final String description;
  final VoidCallback onPress;
  final String userId;
  final String eventId;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: S.dimens.defaultPadding_8,
        vertical: S.dimens.defaultPaddingVertical_8,
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            S.dimens.defaultPaddingVertical_12,
          ),
        ),
        child: InkWell(
          splashColor: S.colors.primary,
          borderRadius: BorderRadius.all(Radius.circular(
            S.dimens.defaultPaddingVertical_12,
          )),
          onTap: onPress,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_4,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.calendar,
                      size: 24,
                      color: S.colors.primary,
                    ),
                    SizedBox(
                      width: S.dimens.defaultPaddingVertical_12,
                    ),
                    Expanded(
                      child: Text(
                        eventName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        softWrap: false,
                        style: S.textStyles.titleHeavy,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: S.dimens.defaultPaddingVertical_12),
                Row(
                  children: [
                    Text(
                      startDate,
                      style: S.textStyles.titleLightPrimary,
                    ),
                    Text(
                      ' - ',
                      style: S.textStyles.titleHeavy,
                    ),
                    Text(
                      endDate,
                      style: S.textStyles.titleLightPrimary,
                    ),
                  ],
                ),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_12,
                ),
                Text(
                  description,
                  style: S.textStyles.description,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
