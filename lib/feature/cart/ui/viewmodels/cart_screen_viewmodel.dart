import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/feature/cart/data/repository/cart_repo_impl.dart';
import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';
import 'package:food_delivery_app/feature/cart/domain/use_cases/add_item_usecase.dart';
import 'package:food_delivery_app/feature/cart/domain/use_cases/get_items_usecase.dart';

import '../../domain/use_cases/remove_item_usecase.dart';
import '../../domain/use_cases/update_item_usecase.dart';

class CartScreenViewModel extends ChangeNotifier {
  List<CartItemEntity>? _itemsList;
  List<CartItemEntity>? get itemsList => _itemsList;
  bool actionStatus = false;

  Future<void> getItems() async {
    var x = await GetItemsUseCase(cartRepository: CartRepoImpl()).call();
    x.fold((error) => print(error.errorMessage), (done) async {
      _itemsList = (done as List<CartItemEntity>?);
    });
    notifyListeners();
  }

  Future<void> addItem(CartItemEntity item) async {
    var x = await AddItemUseCase(cartRepository: CartRepoImpl()).call(item);
    x.fold((error) => print(error.errorMessage), (done) async {
      actionStatus = (done as bool);
    });
    notifyListeners();
  }

  Future<void> updateItem(CartItemEntity item) async {
    var x = await UpdateItemUseCase(cartRepository: CartRepoImpl()).call(item);
    x.fold((error) => print(error.errorMessage), (done) async {
      actionStatus = (done as bool);
      if (actionStatus == true) {
        var currentIndex = _itemsList?.indexOf(item);
        _itemsList?[currentIndex!] = item;
      }
    });
  }

  Future<void> removeItem(CartItemEntity item) async {
    var x =
        await RemoveItemUseCase(cartRepository: CartRepoImpl()).call(item.id);
    x.fold((error) => print(error.errorMessage), (done) async {
      actionStatus = (done as bool);
      if (actionStatus == true) {
        _itemsList?.remove(item);
      }
    });
  }
}
