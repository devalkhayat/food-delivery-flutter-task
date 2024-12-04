import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

class AppIconButton extends StatelessWidget {
  final String imageLocation;
  final VoidCallback action;

   AppIconButton({Key? key,required this.imageLocation,required this.action}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return circle(imageLocation: imageLocation, action: action);
  }

  circle({required String imageLocation,required Function action}){
    return Container(
      height: 32,
      width: 32,
      decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: colors.primaryColor
      ),
      child: IconButton(
          onPressed: () => {
            action()
          },
          icon: SvgPicture.asset(imageLocation,colorFilter: const ColorFilter.mode(colors.white, BlendMode.srcATop),)),
    );
  }
}
