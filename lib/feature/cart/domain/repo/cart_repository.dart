import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';
import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';

abstract class CartRepository{
  Future<Either<Failure,List<CartItemEntity>>> getItems();
  Future<Either<Failure,bool>> addItem(CartItemEntity item);
  Future<Either<Failure,bool>> removeItem(int id);
  Future<Either<Failure,bool>> updateItem(CartItemEntity item);
}