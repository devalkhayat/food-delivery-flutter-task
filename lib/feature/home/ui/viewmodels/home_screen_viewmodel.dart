import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';
import 'package:food_delivery_app/feature/home/data/repository/meals_repo_impl.dart';
import 'package:food_delivery_app/feature/home/domain/entities/category_entity.dart';
import 'package:food_delivery_app/feature/home/domain/entities/meal_entity.dart';
import 'package:food_delivery_app/feature/home/domain/use_cases/get_meals_usecase.dart';
import 'package:provider/provider.dart';

import '../../../../core/failure.dart';
import '../../../cart/data/repository/cart_repo_impl.dart';
import '../../../cart/domain/use_cases/get_items_usecase.dart';
import '../../data/repository/categories_repo_impl.dart';
import '../../domain/use_cases/get_categories_usecase.dart';

class HomeScreenViewModel extends ChangeNotifier {
  List<HomeScreenModel> _iList = [];
  List<HomeScreenModel> get iList => _iList;


  Future<void> getData() async {
    List<CategoryEntity> categoris = [];

    var x = await GetCategoriesUseCase(repository: CategoriesRepoImpl()).call();

    x.fold((error) => print(error.errorMessage), (done) async {
      categoris = (done as List<CategoryEntity>);
    });

    await Future.forEach<CategoryEntity>(categoris, (item) async {
      _iList.add(
          HomeScreenModel(category: item, meals: await getMeals(item.name)));
    });

    notifyListeners();
  }

  Future<List<MealEntity>> getMeals(String name) async {
    List<MealEntity> temp = [];

    var x = await GetMealsUseCase(repository: MealsRepoImpl()).call(name);

    x.fold((error) => print(error.errorMessage), (done) async {
      var result = (done as List<MealEntity>);

      await Future.forEach<MealEntity>(result, (item) async {
        temp.add(item);
      });
    });

    return temp;
  }



}

class HomeScreenModel {
  final CategoryEntity category;
  final List<MealEntity> meals;

  HomeScreenModel({required this.category, required this.meals});
}
