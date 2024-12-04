import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';
import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';
import 'package:food_delivery_app/feature/favorites/domain/repo/favorites_repository.dart';
import 'package:food_delivery_app/core/constants.dart' as constants;

import '../../../../core/local/hive_config.dart';

class FavoritesRepoImpl extends FavoritesRepository{

  late String boxName;
  FavoritesRepoImpl(){
    boxName=constants.hiveFavorites;
  }

  @override
  Future<Either<Failure, List<FavoriteItemEntity>>> getItems() async {
    List<FavoriteItemEntity> i = [];

    await HiveConfig.open(boxName: boxName).then((x) async => {
      await x.getAllKeys().then((keys) async => {
        for (var r in keys)
          {i.add(FavoriteItemEntity.fromJson(await x.get(r)))}
      })
    });

    return Right(i);
  }

  @override
  Future<Either<Failure, bool>> removeItem(FavoriteItemEntity item) async{
    try {
      var box = await HiveConfig.open(boxName: boxName);
      box.delete(item.id.toString());
      return right(true);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> addItem(FavoriteItemEntity item) async {
    try {
      var box = await HiveConfig.open(boxName: boxName);
      box.put(item.id.toString(), item.toJson());
      return right(true);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

}