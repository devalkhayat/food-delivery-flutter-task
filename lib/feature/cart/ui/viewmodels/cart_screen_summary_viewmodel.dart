import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';

class CartScreenSummaryViewmodel extends ChangeNotifier {
  num subTotal = 0.00;
  num promoCode = 3.00;
  num delivery = 5.00;
  num netTotal = 0.00;
  int itemsNumber = 0;

  void CalcNet(List<CartItemEntity> itemsList) {
    var subTotalCalc = 0.00;
    for (var item in itemsList) {
      subTotalCalc += item.totalAmount;
    }

    this.subTotal=subTotalCalc;
    this.netTotal = (subTotalCalc + delivery) - promoCode;
    this.itemsNumber = itemsList.length;

    notifyListeners();
  }
}
