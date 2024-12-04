import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import '../viewmodels/favorites_screen_viewmodel.dart';

class FavoritesList extends StatefulWidget {
  const FavoritesList({super.key});

  @override
  State<FavoritesList> createState() => _FavoritesListState();
}

class _FavoritesListState extends State<FavoritesList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        boxShadow: [
          BoxShadow(blurRadius: 40, color: colors.white3, spreadRadius: 0)
        ],
      ),
      child: FutureBuilder(
          future: context.read<FavoritesScreenViewModel>().getItems(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.waiting) {
              return Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: SizedBox(
                      height: 80,
                      width: 80,
                      child: Lottie.asset('assets/lottie/loading.json')),
                ),
              );
            } else {
              if (dataSnapshot.error != null) {
                return const Center(
                  child: Text("error "),
                );
              } else {
                return display();
              }
            }
          }),
    );
  }

  display() {

    var data = context.watch<FavoritesScreenViewModel>().itemsList;

   return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          if (data!.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: SizedBox(
                    height: 160,
                    width: 160,
                    child: Lottie.asset('assets/lottie/empty_favorite.json')),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (BuildContext context, int index) {
                return getListItem(data[index], index, setState);
              },
            );
          }
        });

  }

//////////////List item//////////////////

  getListItem(FavoriteItemEntity currentItem, int index, StateSetter setState) {
    return Card(
      elevation: 0.5,
      color: colors.white,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Colors.white60, width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            getImagePreview(currentItem.imageLocation),
            getInformation(currentItem.name, currentItem.price),
            getActions(index, setState)
          ],
        ),
      ),
    );
  }

  getImagePreview(String location) {
    return Align(
      alignment: Alignment.topCenter,
      child: CircleAvatar(
        radius: 38, // Image radius
        backgroundImage: NetworkImage(location),
        backgroundColor: colors.gray7,
      ),
    );
  }

  getInformation(String name, num price) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0,right: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colors.black),
            ),
            Text(
              price.toString() + r"$",
              style: Theme.of(context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: colors.primaryColor),
            )
          ],
        ),
      ),
    );
  }

  getActions(int index, StateSetter setState) {
    var items = context.watch<FavoritesScreenViewModel>().itemsList;
    var currentItem = items![index];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        IconButton(
            onPressed: () => {
                  setState(() {
                    Provider.of<FavoritesScreenViewModel>(context,
                            listen: false)
                        .removeItem(currentItem);
                  })
                },
            icon: SvgPicture.asset("assets/images/ic_like_remove.svg")),
      ],
    );
  }
}
