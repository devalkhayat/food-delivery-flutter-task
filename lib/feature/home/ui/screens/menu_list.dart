import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/entities/meal_entity.dart';
import '../viewmodels/home_screen_viewmodel.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:lottie/lottie.dart';

import 'meal_item.dart';

class Menulist extends StatelessWidget {
  late BuildContext _context;

  Menulist({super.key});

  @override
  Widget build(BuildContext context) {
    _context = context;
    return categories();
  }

  Widget categories() {
    return FutureBuilder(
        future: _context.read<HomeScreenViewModel>().getData(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.waiting) {
            return  Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child:  SizedBox(height: 80,width:80,child: Lottie.asset('assets/lottie/loading.json')),
              ),
            );
          } else {
            if (dataSnapshot.error != null) {
              return const Center(
                child: Text('An error occured'),
              );
            } else {
              return display();
            }
          }
        });
  }

  Widget display() {
    var categoryList = _context.watch<HomeScreenViewModel>().iList;
    return Container(
      padding: const EdgeInsets.only(top: 8.0),
      height: 500,
      child: DefaultTabController(
          length: categoryList.length,
          initialIndex: 0,
          child: Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: tabBarView(),
            ),
            appBar: tabBar(),
          )),
    );
  }

  PreferredSizeWidget tabBar() {
    var categoryList = _context.watch<HomeScreenViewModel>().iList;
    return TabBar(
        indicatorColor: colors.primaryColor,
        isScrollable: true,
        dividerColor: Colors.transparent,
        tabAlignment: TabAlignment.start,
        labelPadding: const EdgeInsets.only(left: 8.0, right: 16.0),
        labelColor: colors.primaryColor,
        tabs: categoryList
            .map((e) => Tab(
                    child: Text(
                  e.category.name,
                  style: Theme.of(_context).textTheme.labelSmall?.copyWith(color: colors.gray50,fontWeight: FontWeight.bold) ,
                )))
            .toList()
            .toList());
  }

  Widget tabBarView() {
    var categoryList = _context.watch<HomeScreenViewModel>().iList;
    return TabBarView(

        children: categoryList
            .map((e) => Container(
                  child: page(e.meals),
                ))
            .toList());
  }

  //
  Widget page(List<MealEntity> meals) {
    return Container(
      padding: const EdgeInsets.only(top: 8),
      child: GridView.builder(
      //  physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 0,
          mainAxisSpacing: 20,
          mainAxisExtent: 250,
        ),
        itemCount: meals.length,
        itemBuilder: (BuildContext context, int index) {
          return MealItem(meal:meals[index]);
        },
      ),
    );
  }


}
