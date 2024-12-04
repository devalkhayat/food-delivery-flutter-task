import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';
import 'package:food_delivery_app/feature/favorites/domain/use_cases/add_item_usecase.dart';
import 'package:food_delivery_app/feature/favorites/domain/use_cases/get_items_usecase.dart';
import '../../../favorites//domain/use_cases/remove_item_usecase.dart';
import '../../data/repository/favorites_repo_impl.dart';

class FavoritesScreenViewModel extends ChangeNotifier {
  List<FavoriteItemEntity>? _itemsList;
  List<FavoriteItemEntity>? get itemsList => _itemsList;
  bool actionStatus = false;
  late String favImage = "ic_like_add";

  Future<void> getItems() async {
    var x =
        await GetItemsUseCase(favoritesRepository: FavoritesRepoImpl()).call();
    x.fold((error) => print(error.errorMessage), (done) async {
      _itemsList = (done as List<FavoriteItemEntity>?);

    });
    notifyListeners();
  }

  Future<void> addItem(FavoriteItemEntity item) async {
    var x = await AddItemUseCase(favoritesRepository: FavoritesRepoImpl())
        .call(item);
    x.fold((error) => print(error.errorMessage), (done) async {
      actionStatus = (done as bool);
      if (actionStatus) {
        favImage = "ic_like_remove";
      }
    });
    notifyListeners();
  }

  Future<void> removeItem(FavoriteItemEntity item) async {
    var x = await RemoveItemUseCase(favoritesRepository: FavoritesRepoImpl())
        .call(item);
    x.fold((error) => print(error.errorMessage), (done) async {
      actionStatus = (done as bool);
      if (actionStatus == true) {
        _itemsList?.remove(item);
      }
    });

    //notifyListeners();
  }
}
