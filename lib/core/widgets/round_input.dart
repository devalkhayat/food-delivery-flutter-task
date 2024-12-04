import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/theme_data/styles.dart';

class RoundInput extends StatelessWidget {
  final String hint;
  const RoundInput({super.key, required this.hint});

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
