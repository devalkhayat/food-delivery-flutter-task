import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/feature/cart/ui/cart_strings.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:dotted_line/dotted_line.dart';
import 'package:food_delivery_app/feature/cart/ui/viewmodels/cart_screen_summary_viewmodel.dart';
import 'package:food_delivery_app/feature/cart/ui/viewmodels/cart_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class NetSummary extends StatefulWidget {
  const NetSummary({super.key});

  @override
  State<NetSummary> createState() => _NetSummaryState();
}

class _NetSummaryState extends State<NetSummary> {
  @override
  Widget build(BuildContext context) {

    var model=context.watch<CartScreenSummaryViewmodel>();
    if(context.watch<CartScreenViewModel>().itemsList!.isEmpty){
      return Container(child: const Text(""),);

    }else{
      return Column(
        children: [
          getSection(CartStrings.subTotal, model!.subTotal.toString()),
          getSection(CartStrings.promoCodeInputPlaceHolder, model!.promoCode.toString()),
          getSection(CartStrings.delivery, model!.delivery.toString()),
          const DottedLine(),
          getFinalSection(model!.netTotal.toString(),model!.itemsNumber)
        ],
      );
    }


  }

  getSection(String title, String amount) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              Text(
                r"$" + amount,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                "USD",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(color: colors.gray11),
              )
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          const DottedLine(
            dashGapLength: 0.0,
            dashColor: colors.gray12,
          ),
        ],
      ),
    );
  }

  getFinalSection(String amount,int quantity) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      CartStrings.total,
                      style: Theme.of(context).textTheme.labelSmall,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      "(${quantity} ${CartStrings.items})",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: colors.gray13),
                    ),
                  ],
                ),
              ),
              Text(
                r"$" + amount,
                style: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                width: 8.0,
              ),
              Text(
                "USD",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    color: colors.gray11, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}


