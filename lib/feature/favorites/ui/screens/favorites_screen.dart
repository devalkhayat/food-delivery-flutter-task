import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/feature/favorites/ui/favorites_strings.dart';
import 'package:food_delivery_app/feature/favorites/ui/screens/favorites_list.dart';

class favorites_screen extends StatefulWidget {
  const favorites_screen({super.key});

  @override
  State<favorites_screen> createState() => _favorites_screenState();
}

class _favorites_screenState extends State<favorites_screen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: getAppBar(context),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: FavoritesList(),
        ),
      );

  }

  getAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        FavoritesStrings.screenTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset("assets/images/ic_back.svg")),
    );
  }
}
