import 'package:flutter/cupertino.dart';

import '../../../../core/widgets/app_button.dart';
import '../cart_strings.dart';

class Checkout extends StatelessWidget {
  const Checkout({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 242,
        child: Appbutton(
          title: CartStrings.checkout,
          action: () {},
        ),
      ),
    );
  }
}
