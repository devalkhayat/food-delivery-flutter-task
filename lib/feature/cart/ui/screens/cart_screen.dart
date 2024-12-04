import 'package:flutter/material.dart';
import 'package:food_delivery_app/feature/cart/ui/screens/appbar.dart';
import 'package:food_delivery_app/feature/cart/ui/screens/cart_list.dart';
import 'package:food_delivery_app/feature/cart/ui/screens/promo_code.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../viewmodels/cart_screen_viewmodel.dart';
import 'checkout.dart';
import 'net_summary.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
 
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
        child: display(),
      ),
      appBar: const Appbar(),
    );
  }

  display() {
    return FutureBuilder(
        future: context.read<CartScreenViewModel>().getItems(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: SizedBox(
                    height: 80,
                    width: 80,
                    child: Lottie.asset('assets/lottie/loading.json')),
              ),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text('An error occured'),
              );
            } else {
              return handler();
            }
          }
        });
  }

  handler() {
    var data = context.watch<CartScreenViewModel>().itemsList;
    if (data!.isEmpty) {
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
      return content();
    }
  }

  content() {
    return const SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 360, child: CartList()),
          Column(
            children: [
              SizedBox(
                height: 16,
              ),
              PromoCode(),
              SizedBox(
                height: 16,
              ),
              NetSummary(),
              SizedBox(
                height: 16,
              ),
              Checkout()
            ],
          )
        ],
      ),
    );
  }
}
