import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/core/theme/theme_data/styles.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

class RoundInput extends StatelessWidget {
  final String hint;
  const RoundInput({Key? key, required String this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(inputDecorationTheme: Styles.inputRoundDeco),
      child: TextField(
        decoration: InputDecoration(
            hintText: hint,
          ),
      ),
    );
  }
}
