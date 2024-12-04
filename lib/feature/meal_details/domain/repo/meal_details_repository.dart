import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/core/failure.dart';
import 'package:food_delivery_app/feature/meal_details/domain/entities/meal_details_entity.dart';

abstract class MealDetailsRepository{
  Future<Either<Failure,MealDetailsEntity>> getDetails(String id);
}