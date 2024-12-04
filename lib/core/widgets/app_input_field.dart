import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

class CustomInput extends StatelessWidget {
  final String label;
  final String hint;
  final bool isSecureField;

  const CustomInput(
      {super.key,
      required this.label,
      required this.hint,
      this.isSecureField = false});

  @override
  Widget build(BuildContext context) {
    bool showPassword = false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.labelSmall,
        ),
        const SizedBox(
          height: 10,
        ),
        StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
          return Material(
            elevation: 5.5,
            color: Colors.white,
            shadowColor: colors.white2,
            borderRadius: BorderRadius.circular(10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: hint,
                  suffixIcon: isSecureField == true
                      ? IconButton(
                          onPressed: () {
                            setState(() => showPassword = !showPassword);
                          },
                          icon: Icon(
                            showPassword == false
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: colors.gray7,
                          ))
                      : null),
              obscureText: !showPassword,
            ),
          );
        }),
      ],
    );
  }
}
