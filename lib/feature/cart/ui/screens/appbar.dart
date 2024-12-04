import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../cart_strings.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget{

  const Appbar({ Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return  AppBar(
      centerTitle: true,
      title: Text(
        CartStrings.screenTitle,
        style: Theme.of(context).textTheme.titleLarge,
      ),
      leading: IconButton(
          onPressed: () => {Navigator.pop(context)},
          icon: SvgPicture.asset("assets/images/ic_back.svg")),
    );
  }

  @override

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
