import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/feature/meal_details/data/models/MealDetailsModel.dart';
import 'package:food_delivery_app/feature/meal_details/domain/entities/meal_details_entity.dart';
import 'package:food_delivery_app/feature/meal_details/domain/repo/meal_details_repository.dart';

import '../../../../core/failure.dart';
import '../../../../core/network/consumer.dart';

class MealDetailsRepoImpl extends MealDetailsRepository {
  final consumer = Consumer();

  @override
  Future<Either<Failure, MealDetailsEntity>> getDetails(String id) async {
    try {

      MealDetailsEntity dataResult;
      var data = await consumer.getMealDetails(id);

      var result = MealDetailsResponse.fromJson(jsonDecode(data.body));

      //

      var item = result.meals.first;

      String deliveryInfo =
          "Delivered between Sunday aug and Friday from 8pm to 00:00 pm";
      dataResult = MealDetailsEntity(
          id: item.idMeal,
          name: item.strMeal,
          category: item.strCategory,
          imageUrl: item.strMealThumb,
          price: 9.99,
          rate: "4.5",
          description: item.strInstructions,
          deliveryInfo: deliveryInfo);

      return Right(dataResult);
    } catch (ex) {
      return Left(Failure(errorMessage: ex.toString()));
    }
  }
}
