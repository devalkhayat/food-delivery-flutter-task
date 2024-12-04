import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/app_icon_button.dart';
import '../viewmodels/meal_details_screen_viewmodel.dart';

class QuantityCounter extends StatelessWidget {
  late BuildContext _context;
  QuantityCounter({super.key});

  @override
  Widget build(BuildContext context) {
    _context = context;
    return getIncreaseDecrease();
  }

  getIncreaseDecrease() {
    var x = Provider.of<MealDetailsScreenViewModel>(_context, listen: true);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIconButton(
            imageLocation: "assets/images/ic_items_subtract.svg",
            action: () => {x.decreaseQuantity()}),
        Padding(
          padding: const EdgeInsets.only(bottom: 0, left: 8, right: 8),
          child: ValueListenableBuilder(
              valueListenable: x.quantity,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(value.toString());
              }),
        ),
        AppIconButton(
            imageLocation: "assets/images/ic_items_add.svg",
            action: () => {x.increaseQuantity()})
      ],
    );
  }
}