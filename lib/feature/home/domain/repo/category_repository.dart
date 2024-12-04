import 'package:dartz/dartz.dart';
import 'package:food_delivery_app/feature/home/domain/entities/category_entity.dart';

import '../../../../core/failure.dart';

abstract class CategoriesRepository{

  Future<Either<Failure,List<CategoryEntity>>>  getAllCategories();

}