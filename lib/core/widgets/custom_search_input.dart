import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/theme/theme_data/styles.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

class CustomSearchinput extends StatelessWidget {
  final String hint;
  const CustomSearchinput({Key? key, required String this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(inputDecorationTheme: Styles.inputSearchDeco),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
            prefixIcon: IconButton(
                onPressed: () => {},
                icon: SvgPicture.asset("assets/images/ic_search.svg"))),
      ),
    );
  }
}
