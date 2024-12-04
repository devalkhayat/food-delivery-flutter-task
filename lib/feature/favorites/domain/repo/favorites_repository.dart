import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';

import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';

abstract class FavoritesRepository{
  Future<Either<Failure,List<FavoriteItemEntity>>> getItems();
  Future<Either<Failure,bool>> addItem(FavoriteItemEntity item);
  Future<Either<Failure,bool>> removeItem(FavoriteItemEntity item);

}