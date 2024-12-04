import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/core/widgets/app_button.dart';
import 'package:food_delivery_app/feature/cart/ui/cart_strings.dart';
import 'package:provider/provider.dart';

import '../../../../core/widgets/round_input.dart';
import '../viewmodels/cart_screen_viewmodel.dart';
class PromoCode extends StatefulWidget {
  const PromoCode({super.key});

  @override
  State<PromoCode> createState() => _PromoCodeState();
}

class _PromoCodeState extends State<PromoCode> {
  @override
  Widget build(BuildContext context) {

    if(context.watch<CartScreenViewModel>().itemsList!.isEmpty){
      return Container(child: const Text(""),);

    }else{
      return  Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(child: RoundInput(hint: CartStrings.promoCodeInputPlaceHolder,)),
          const SizedBox(width: 8,),
          Appbutton(title: CartStrings.promoCodeButton , action: ()=>{

          })
        ],
      );
    }

  }
}

