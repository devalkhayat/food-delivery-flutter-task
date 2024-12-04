import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';
import 'package:food_delivery_app/feature/home/domain/entities/meal_entity.dart';
import 'package:food_delivery_app/feature/home/domain/repo/meal_repository.dart';

import '../../../../core/network/consumer.dart';
import '../models/meal_model.dart';

class MealsRepoImpl extends MealRepository {
  final consumer = Consumer();
  @override
  Future<Either<Failure, List<MealEntity>>> getAllMeals(String name) async {
    try {

      List<MealEntity> mealsResult = [];
      var data = await consumer.getMeals(name);

      var result = MealsResponse.fromJson(jsonDecode(data.body));

      //

      for (var item in result.meals) {
        mealsResult.add(MealEntity(
          id: item.id,
          name: item.name,
          image: item.image,
          rate: "4.5",
          price: "9.99"));
      }
      return Right(mealsResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }
}
