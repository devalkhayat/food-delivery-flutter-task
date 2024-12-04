import 'package:flutter/material.dart';
import 'package:food_delivery_app/core/constants.dart';
import 'package:food_delivery_app/core/theme/theme_data/app_theme_data.dart';
import 'package:food_delivery_app/feature/cart/ui/viewmodels/cart_screen_viewmodel.dart';
import 'package:food_delivery_app/feature/favorites/ui/viewmodels/favorites_screen_viewmodel.dart';
import 'package:food_delivery_app/feature/home/ui/viewmodels/home_screen_viewmodel.dart';
import 'package:food_delivery_app/feature/meal_details/ui/viewmodels/meal_details_screen_viewmodel.dart';
import 'package:provider/provider.dart';
import 'core/local/hive_config.dart';
import 'feature/cart/ui/viewmodels/cart_screen_summary_viewmodel.dart';
import 'feature/spalsh/ui/screens/splash_screen.dart';
void main() async{
  await HiveConfig.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenViewModel(),),
        ChangeNotifierProvider(create: (context) => MealDetailsScreenViewModel(),),
        ChangeNotifierProvider(create: (context) => CartScreenViewModel(),),
        ChangeNotifierProvider(create: (context) => FavoritesScreenViewModel(),),
        ChangeNotifierProvider(create: (context) => CartScreenSummaryViewmodel(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: appName,
        theme: getAppTheme(),
        home:const Splashscreen(), //MealDetailsScreen(mealID: "52874",) ,
      ),
    );
  }
}
