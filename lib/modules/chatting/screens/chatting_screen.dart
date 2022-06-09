import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:toy_exchange_application_toydee/core/routing/navigation_service.dart';
import 'package:toy_exchange_application_toydee/core/routing/route_paths.dart';
import 'package:toy_exchange_application_toydee/core/widgets/header_screen.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/components/chat_user_item.dart';
import 'package:toy_exchange_application_toydee/modules/chatting/viewmodels/chatting_view_model.dart';

import '../../../core/styles/styles.dart';

class ChattingScreen extends ConsumerWidget {
  const ChattingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: S.colors.background_1,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: S.dimens.defaultPaddingVertical_16,
            ),
            child: Column(
              children: [
                const HeaderScreen(title: ""),
                SizedBox(
                  height: S.dimens.defaultPaddingVertical_16,
                ),
                ref.watch(getChattingProvider).when(
                      data: (data) {
                        return SizedBox(
                          height: 600,
                          child: ListView.builder(
                            itemCount: data.size,
                            itemBuilder: (itemBuilder, index) {
                              if (data.docs[index]['requestingUserId'] !=
                                  FirebaseAuth.instance.currentUser!.uid) {
                                return ref
                                    .watch(
                                      getRequestingUserProvider(
                                        data.docs[index]['requestingUserId']
                                            .toString(),
                                      ),
                                    )
                                    .when(
                                      data: (value) {
                                        log(value.exists.toString());
                                        return ChatUserItem(
                                            image: value.get('imageUrl'),
                                            dateTime: DateTime.now(),
                                            nameUser: value.get('userName'),
                                            messageText: "messageText",
                                            onTap: () {
                                              NavigationService.push(
                                                page: RoutePaths
                                                    .chattingMessageScreen,
                                                isNamed: true,
                                                arguments: data.docs[index].id,
                                              );
                                            });
                                      },
                                      error: (error, stack) => Center(
                                        child: Lottie.network(
                                            'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                                      ),
                                      loading: () => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                              } else {
                                return ref
                                    .watch(
                                      getRequestingUserProvider(
                                        data.docs[index]['requestedUserId']
                                            .toString(),
                                      ),
                                    )
                                    .when(
                                      data: (value) {
                                        log(value.exists.toString());
                                        return ChatUserItem(
                                            image: value.get('imageUrl'),
                                            dateTime: DateTime.now(),
                                            nameUser: value.get('userName'),
                                            messageText: "messageText",
                                            onTap: () {
                                              NavigationService.push(
                                                page: RoutePaths
                                                    .chattingMessageScreen,
                                                isNamed: true,
                                                arguments: data.docs[index].id,
                                              );
                                            });
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
                          ),
                        );
                      },
                      error: (error, stack) => Center(
                        child: Lottie.network(
                            'https://assets9.lottiefiles.com/packages/lf20_hXHdlx.json'),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
