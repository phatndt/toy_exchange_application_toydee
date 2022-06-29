import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/core/widgets/header_screen.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/components/chatting_left_item.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/components/chatting_right_item.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/viewmodels/chatting_view_model.dart';

import '../../../core/styles/styles.dart';

class ChattingMessageScreen extends ConsumerWidget {
  const ChattingMessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final args = ModalRoute.of(context)!.settings.arguments as String;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: S.dimens.defaultPaddingVertical_16),
          child: Column(
            children: [
              const HeaderScreen(title: ""),
              SizedBox(
                height: S.dimens.defaultPaddingVertical_16,
              ),
              Expanded(
                child: ref.watch(getChattingMessageProvider(args)).when(
                      data: (data) {
                        if (data.docs.isEmpty) {
                          return Container();
                        } else {
                          return ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (itemBuilder, index) {
                              if (data.docs[index]['sentBy'] ==
                                  FirebaseAuth.instance.currentUser!.uid) {
                                return ChattingRightItem(
                                  message: data.docs[index]['messageText'],
                                  time: DateFormat('hh:mm').format(
                                    DateTime.parse(data.docs[index]['sentAt']),
                                  ),
                                );
                              } else {
                                return ref
                                    .watch(getRequestingUserProvider(
                                        data.docs[index]['sentBy']))
                                    .when(
                                      data: (value) {
                                        return ChattingLeftItem(
                                          message: data.docs[index]
                                              ['messageText'],
                                          time: DateFormat('hh:mm').format(
                                            DateTime.parse(
                                                data.docs[index]['sentAt']),
                                          ),
                                          image: value['imageUrl'],
                                          name: '',
                                        );
                                      },
                                      error: (error, stack) => Center(
                                        child: Lottie.network(
                                            'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                                      ),
                                      loading: () => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                              }
                            },
                          );
                        }
                      },
                      error: (error, stack) => Center(
                        child: Lottie.network(
                            'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                    vertical: S.dimens.defaultPaddingVertical_16),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(35.0),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 3),
                                blurRadius: 5,
                                color: Colors.grey)
                          ],
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: S.dimens.defaultPaddingVertical_8),
                          child: Row(
                            children: <Widget>[
                              const Icon(Icons.face),
                              SizedBox(
                                width: S.dimens.defaultPaddingVertical_4,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: ref
                                      .watch(chattingSettingNotifier)
                                      .messageController,
                                  decoration: const InputDecoration(
                                      hintText: "Type Something...",
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Container(
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: S.colors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: InkWell(
                        child: const Icon(
                          Icons.send,
                          color: Colors.white,
                        ),
                        onTap: () {
                          ref
                              .watch(chattingSettingNotifier.notifier)
                              .addChattingMessage(
                                  args,
                                  ref
                                      .watch(chattingSettingNotifier)
                                      .messageController
                                      .text);
                          ref
                              .watch(chattingSettingNotifier)
                              .messageController
                              .clear();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
