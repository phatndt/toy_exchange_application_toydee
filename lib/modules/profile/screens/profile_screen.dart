import 'package:flutter/material.dart';

import '../../../core/styles/styles.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(appBar: buildAppBar(context)),
    );
  }

  buildAppBar(BuildContext context) {
    return AppBar(
      leading: BackButton(
        color: S.colors.primary,
      ),
      actions: [
        // IconButton(onPressed: (){}, icon: Icon(icon))
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
