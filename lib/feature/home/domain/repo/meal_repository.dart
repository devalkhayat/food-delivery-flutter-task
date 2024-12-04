import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../entities/meal_entity.dart';

abstract class MealRepository{
  Future<Either<Failure,List<MealEntity>>>  getAllMeals(String name);
}