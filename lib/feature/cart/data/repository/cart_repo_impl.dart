import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';
import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';
import 'package:food_delivery_app/feature/cart/domain/repo/cart_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:food_delivery_app/core/constants.dart' as constants;
import '../../../../core/local/hive_config.dart';

class CartRepoImpl extends CartRepository {
  late String boxName;
  CartRepoImpl() {
    boxName = constants.hiveCart;
  }
  @override
  Future<Either<Failure, bool>> addItem(CartItemEntity item) async {
    try {
      var box = await HiveConfig.open(boxName: boxName);
      box.put(item.id.toString(), item.toJson());
      return right(true);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartItemEntity>>> getItems() async {
    List<CartItemEntity> i = [];

    await HiveConfig.open(boxName: boxName).then((x) async => {
          await x.getAllKeys().then((keys) async => {
                for (var r in keys)
                  {i.add(CartItemEntity.fromJson(await x.get(r)))}
              })
        });

    return Right(i);
  }

  @override
  Future<Either<Failure, bool>> removeItem(int id) async {
    try {
      var box = await HiveConfig.open(boxName: boxName);
      box.delete(id.toString());
      return right(true);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> updateItem(CartItemEntity item) async {

    try {
      var box = await HiveConfig.open(boxName: boxName);
      box.put(item.id.toString(), item.toJson());
      return right(true);
    } catch (e) {
      return left(Failure(errorMessage: e.toString()));
    }
  }
}
