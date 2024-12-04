import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/feature/cart/ui/viewmodels/cart_screen_viewmodel.dart';
import 'package:food_delivery_app/feature/home/ui/home_strings.dart';
import 'package:food_delivery_app/feature/home/ui/screens/search_box.dart';
import 'package:food_delivery_app/feature/home/ui/viewmodels/home_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/general.dart';
import 'menu_list.dart';
import 'package:badges/badges.dart' as badges;

class home_screen extends StatefulWidget {
  const home_screen({super.key});

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {
  @override
  Widget build(BuildContext context) {
    //context.read<HomeScreenViewModel>().getCartTotal();

    return Scaffold(
        appBar: getAppBar(),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 200,
                  child: pageHeader(
                      context: context,
                      title: HomeStrings.headline,
                      textPosition: TextAlign.start),
                ),
                const SizedBox(
                  height: 30.0,
                ),
                const SearchBox(),
                const SizedBox(
                  height: 8.0,
                ),
                Menulist()
              ],
            ),
          ),
        ));
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      actions: [
        IconButton(
            onPressed: () => {},
            icon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: badges.Badge(
                badgeAnimation: const badges.BadgeAnimation.scale(),
                badgeContent: badgeValue(),
                child: SvgPicture.asset("assets/images/ic_cart.svg"),
              ),
            )),
      ],
      leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset("assets/images/ic_menu.svg")),
    );
  }

  badgeValue() {
    return FutureBuilder(
        future:
            Provider.of<CartScreenViewModel>(context, listen: false).getItems(),
        builder: (context, dataSnapshot) {

         var data= Provider.of<CartScreenViewModel>(context, listen: true).itemsList?.length;
          return Text(
            (data.toString()) ?? "0",
            style: Theme.of(context)
                .textTheme
                .labelSmall
                ?.copyWith(color: Colors.white),
          );
        });
  }
}
