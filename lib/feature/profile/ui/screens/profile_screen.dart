import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/feature/profile/ui/profile_strings.dart';
import 'package:food_delivery_app/feature/profile/ui/screens/user_info.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

import 'action_menu.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getAppBar(context),
      body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        decoration: const BoxDecoration(
          color: colors.gray12
         /* gradient: LinearGradient(
            colors: [Colors.green, Color.fromARGB(255, 29, 221, 163)],
          )*/,
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                UserInfo(),
                const SizedBox(
                  height: 20,
                ),
                 ActionMenu()
              ],
            ),
          ),
        ),
      ),
    );
  }

  getAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        ProfileStrings.screenTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset("assets/images/ic_back.svg")),
    );
  }
}
