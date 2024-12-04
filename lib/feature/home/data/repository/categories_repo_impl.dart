import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';
import 'package:food_delivery_app/core/network/consumer.dart';
import 'package:food_delivery_app/feature/home/data/models/category_model.dart';
import 'package:food_delivery_app/feature/home/domain/entities/category_entity.dart';
import 'package:food_delivery_app/feature/home/domain/repo/category_repository.dart';

class CategoriesRepoImpl extends CategoriesRepository {
  final consumer = Consumer();

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories() async {
    try {
      List<CategoryEntity> categoriesResult = [];
      var data = await consumer.getCategories();
      var result = CategoriesResponse.fromJson(jsonDecode(data.body));
      //
      result.categories.forEach((item) => categoriesResult.add(CategoryEntity(id: item.id, name: item.name)));
      return Right(categoriesResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }
}
