import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:food_delivery_app/feature/profile/ui/profile_strings.dart';

class ActionMenu extends StatelessWidget {
   ActionMenu({super.key});
 late BuildContext _context;
  @override
  Widget build(BuildContext context) {
    _context=context;
    return Column(
      children: [
        getMenuItem(ProfileStrings.menuOrders),
        getMenuItem(ProfileStrings.menuPendingReviews),
        getMenuItem(ProfileStrings.menuHelp),
        getMenuItem(ProfileStrings.menuSignOut,true)
      ],
    );
  }

  getMenuItem(String title,[bool isPrimary=false]) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0),
      child: Card(
        elevation: 1,
        color: isPrimary==false?colors.white:colors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, top: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,style: isPrimary==false? Theme.of(_context).textTheme.labelSmall:Theme.of(_context).textTheme.labelSmall?.copyWith(color: colors.white),),
              IconButton(
                  onPressed: () => {},
                  icon: SvgPicture.asset("assets/images/ic_arrow_open.svg",colorFilter: ColorFilter.mode(isPrimary == true ? colors.white : colors.black, BlendMode.srcATop),))
            ],
          ),
        ),
      ),
    );
  }
}
