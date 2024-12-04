import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/feature/cart/ui/viewmodels/cart_screen_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;

import '../../../../core/widgets/app_icon_button.dart';
import '../../../meal_details/ui/screens/meal_details_screen.dart';
import '../../domain/entities/cart_item_entity.dart';
import '../viewmodels/cart_screen_summary_viewmodel.dart';

class CartList extends StatefulWidget {
  const CartList({super.key});

  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(blurRadius: 40, color: colors.white3, spreadRadius: 0)
          ],
        ),
        child: content());
  }

  content() {
    var data = context.watch<CartScreenViewModel>().itemsList;
    (context.read<CartScreenSummaryViewmodel>()).CalcNet(data!);
    if (data.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: SizedBox(
              height: 160,
              width: 160,
              child: Lottie.asset('assets/lottie/empty_cart.json')),
        ),
      );
    } else {
      return ListView.builder(
        shrinkWrap: true,
        //physics: const NeverScrollableScrollPhysics(),
        itemCount: data.length,
        itemBuilder: (BuildContext context, int index) {
          return getListItem(data[index], index);
        },
      );
    }
  }
  //////////////List item//////////////////

  getListItem(CartItemEntity currentItem, int index) {
    return Card(
      elevation: 0.5,
      color: colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white60, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MealDetailsScreen(mealID: currentItem.id.toString())));
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getImagePreview(currentItem.imageLocation),
              getInformation(
                  currentItem.name, currentItem.totalAmount.toString()),
              getCloseCounter(index)
            ],
          ),
        ),
      ),
    );
  }

  getImagePreview(String location) {
    return Align(
      alignment: Alignment.topCenter,
      child: CircleAvatar(
        radius: 38, // Image radius
        backgroundImage: NetworkImage(location),
        backgroundColor: colors.gray7,
      ),
    );
  }

  getInformation(String name, String price) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colors.black),
            ),
            Text(
              price + r"$",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: colors.primaryColor),
            ),
          ],
        ),
      ),
    );
  }

  getCloseCounter(int index) {
    var items = context.read<CartScreenViewModel>().itemsList;
    var currentItem = items![index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () {
              setState(() {
                Provider.of<CartScreenViewModel>(context, listen: false)
                    .removeItem(currentItem);

                Provider.of<CartScreenSummaryViewmodel>(context, listen: false)
                    .CalcNet(items);
              });
            },
            icon: SvgPicture.asset("assets/images/ic_remove.svg")),
        getIncreaseDecrease(index)
      ],
    );
  }

  getIncreaseDecrease(int index) {
    var p = Provider.of<CartScreenViewModel>(context, listen: false);
    var items = context.read<CartScreenViewModel>().itemsList;
    var currentItem = items![index];

    ValueNotifier<int> quantityCounter = ValueNotifier(currentItem.quantity);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppIconButton(
            imageLocation: "assets/images/ic_items_subtract.svg",
            action: () {
              setState(() {
                if (quantityCounter.value >= 1) {
                  //for UI
                  quantityCounter.value -= 1;
                  // for memory and local storage
                  currentItem.quantity -= 1;
                  currentItem.totalAmount =
                      currentItem.quantity * currentItem.price;
                  p.updateItem(currentItem);

                  Provider.of<CartScreenSummaryViewmodel>(context,
                          listen: false)
                      .CalcNet(items);
                }
              });
            }),
        Padding(
          padding: const EdgeInsets.only(bottom: 0, left: 8, right: 8),
          child: ValueListenableBuilder(
              valueListenable: quantityCounter,
              builder: (BuildContext context, int value, Widget? child) {
                return Text(value.toString());
              }),
        ),
        AppIconButton(
            imageLocation: "assets/images/ic_items_add.svg",
            action: () {
              setState(() {
                //for UI
                quantityCounter.value += 1;
                // for memory and local storage
                currentItem.quantity += 1;
                currentItem.totalAmount =
                    currentItem.quantity * currentItem.price;
                p.updateItem(currentItem);

                Provider.of<CartScreenSummaryViewmodel>(context, listen: false)
                    .CalcNet(items);
              });
            })
      ],
    );
  }
}
