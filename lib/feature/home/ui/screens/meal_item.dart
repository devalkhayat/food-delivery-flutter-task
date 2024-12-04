import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:food_delivery_app/feature/meal_details/ui/screens/meal_details_screen.dart';

import '../../domain/entities/meal_entity.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
class MealItem extends StatelessWidget {

  final MealEntity meal;
  late BuildContext _context;
   MealItem({super.key, required this.meal});



  @override
  Widget build(BuildContext context) {
    _context = context;
    return Card(
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        color: colors.white,
        child: Stack(
          children: [
            description(meal.id,meal.name, meal.rate, meal.price),
            thumbnail(meal.image),
          ],
        ),
      ),
    );
  }


  Widget thumbnail(String url) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(blurRadius: 40, color: colors.white2, spreadRadius: 0)
          ],
        ),
        child: CircleAvatar(
          radius: 48, // Image radius
          backgroundImage: NetworkImage(url),
          backgroundColor: colors.gray7,
        ),
      ),
    );
  }

  Widget description(String id,String name, String rate, String price) {

    return InkWell(
      onTap: (){
        Navigator.push(_context, MaterialPageRoute(builder: (context)=>MealDetailsScreen(mealID:id)));
      },
      child: Container(
        margin: const EdgeInsets.only(top: 50),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(blurRadius: 60, color: colors.white3, spreadRadius: 0)
          ],
          color: Colors.white,
          //border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(
              16.0), /*border: Border.all(color: Colors.blueAccent)*/
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80, left: 8, right: 8),
          child: Column(
           // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: Text(name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(_context).textTheme.labelSmall?.copyWith(
                              color: colors.black, fontWeight: FontWeight.bold))),
                  Row(

                    children: [
                      Text(rate,style:  Theme.of(_context).textTheme.bodySmall?.copyWith(
                          color: colors.gray50, fontWeight: FontWeight.bold),),
                      Container(padding: const EdgeInsets.only(top:10),child: SvgPicture.asset("assets/images/ic_star.svg"))
                    ],
                  ),
                ],
              ),
              Text(
                "Mixed pizza",
                style:  Theme.of(_context).textTheme.bodySmall,
              ),
              Row(
                children: [
                  Expanded(
                      child: IconButton(
                          alignment: Alignment.centerLeft,
                          onPressed: () => Navigator.push(_context, MaterialPageRoute(builder: (context)=>MealDetailsScreen(mealID:id))),
                          icon: SvgPicture.asset(
                              "assets/images/ic_arrow_details.svg"))),
                  Expanded(
                      child: Text(
                        price + r"$",
                        textAlign: TextAlign.end,
                        style: Theme.of(_context).textTheme.labelSmall?.copyWith(
                            color: colors.primaryColor, fontWeight: FontWeight.bold),
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
