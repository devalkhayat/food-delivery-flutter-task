import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';
import 'package:food_delivery_app/feature/cart/ui/screens/cart_screen.dart';
import 'package:food_delivery_app/feature/cart/ui/viewmodels/cart_screen_viewmodel.dart';
import 'package:food_delivery_app/feature/favorites/domain/entities/favorite_item_entity.dart';
import 'package:food_delivery_app/feature/favorites/ui/viewmodels/favorites_screen_viewmodel.dart';
import 'package:food_delivery_app/feature/meal_details/domain/entities/meal_details_entity.dart';
import 'package:food_delivery_app/feature/meal_details/ui/meal_details_strings.dart';
import 'package:food_delivery_app/feature/meal_details/ui/screens/quantity_counter.dart';
import 'package:food_delivery_app/feature/meal_details/ui/viewmodels/meal_details_screen_viewmodel.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_app/core/theme/util/colors.dart' as colors;
import '../../../../core/widgets/app_button.dart';

class MealDetailsScreen extends StatelessWidget {
  final String mealID;
  MealDetailsScreen({super.key, required this.mealID});

  late BuildContext _context;
  late MealDetailsEntity currentItem;


  @override
  Widget build(BuildContext context) {
    _context = context;

    return Scaffold(
      appBar: getAppBar(_context),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _context.read<MealDetailsScreenViewModel>().getData(mealID),
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
                    child: Text('An error occured'),
                  );
                } else {

                  return display();
                }
              }
            }),
      ),
    );
  }

  display() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        getImagePreview(),
        const SizedBox(
          height: 8,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Column(
            children: [
              getPriceCounter(),
              const SizedBox(
                height: 8,
              ),
              getInformation(),
              const SizedBox(
                height: 16,
              ),
              getDescription(),
              const SizedBox(
                height: 8,
              ),
              getDeliveryInfo(),
              const SizedBox(
                height: 16,
              ),
              getAddToCard(),
              const SizedBox(
                height: 16,
              ),
            ],
          ),
        )
      ],
    );
  }

  getAddToCard() {
    var data = _context.watch<MealDetailsScreenViewModel>();
    currentItem=data.detailsEntity!;
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: 242,
        child: Appbutton(
          title: MealDetailsStrings.addToCart,
          action: () async {
            Provider.of<CartScreenViewModel>(_context, listen: false)
                .addItem(CartItemEntity(
                    id: int.parse(data.detailsEntity!.id),
                    name: data.detailsEntity!.name,
                    imageLocation: data.detailsEntity!.imageUrl,
                    price: data.detailsEntity!.price,
                    quantity: data.quantity.value,
                    totalAmount:
                        data.detailsEntity!.price * data.quantity.value))
                .then((d) {
              Future.delayed(const Duration(milliseconds: 500), () async {
                Navigator.of(_context).push(
                    MaterialPageRoute(builder: (context) => const CartScreen()));
              });
            });
          },
        ),
      ),
    );
  }

  getImagePreview() {
    var data = _context.watch<MealDetailsScreenViewModel>();
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(blurRadius: 30, color: colors.gray5, spreadRadius: 0)
          ],
        ),
        child: CircleAvatar(
          radius: 100, // Image radius
          backgroundImage: NetworkImage(data.detailsEntity!.imageUrl),
          backgroundColor: colors.gray7,
        ),
      ),
    );
  }

  getPriceCounter() {
    var data = _context.watch<MealDetailsScreenViewModel>();
    return Row(
      children: [
        Expanded(
            child: Text(
          "${data.detailsEntity?.price}" r"$",
          style: Theme.of(_context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: colors.primaryColor),
        )),
        QuantityCounter()
      ],
    );
  }

  getInformation() {
    var data = _context.watch<MealDetailsScreenViewModel>();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 4.0),
            child: Text(
              data.detailsEntity!.name,
              style: Theme.of(_context)
                  .textTheme
                  .labelSmall
                  ?.copyWith(color: colors.black, fontSize: 24),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Row(
            children: [
              Text(
                data.detailsEntity!.rate,
                style: Theme.of(_context)
                    .textTheme
                    .labelSmall
                    ?.copyWith(fontSize: 24, color: colors.black),
              ),
              Container(
                  padding: const EdgeInsets.only(top: 10),
                  child: SvgPicture.asset(
                    "assets/images/ic_star.svg",
                    width: 32,
                    height: 32,
                  ))
            ],
          ),
        )
      ],
    );
  }

  getDescription() {
    var data = _context.watch<MealDetailsScreenViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MealDetailsStrings.descriptionTitle,
            style: Theme.of(_context).textTheme.labelSmall),
        const SizedBox(
          height: 8.0,
        ),
        Text(data.detailsEntity!.description,
            style: Theme.of(_context).textTheme.bodySmall)
      ],
    );
  }

  getDeliveryInfo() {
    var data = _context.watch<MealDetailsScreenViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(MealDetailsStrings.deliveryInfoTitle,
            style: Theme.of(_context).textTheme.labelSmall),
        const SizedBox(
          height: 8.0,
        ),
        Text(data.detailsEntity!.deliveryInfo,
            style: Theme.of(_context).textTheme.bodySmall)
      ],
    );
  }

  getAppBar(BuildContext context) {

      return AppBar(
        actions: [
      getAction()

        ],
        leading: IconButton(
            onPressed: () => {Navigator.pop(context)},
            icon: SvgPicture.asset("assets/images/ic_back.svg")),
      );

  }

  getAction(){
    return Consumer<FavoritesScreenViewModel>(builder: (context, item, child){
      return IconButton(
          onPressed: ()  {

            Provider.of<FavoritesScreenViewModel>(_context, listen: false)
                .addItem(FavoriteItemEntity(
                id: int.parse(currentItem.id),
                name: currentItem.name,
                imageLocation: currentItem.imageUrl,
                price: currentItem.price));


          },
          icon: SvgPicture.asset("assets/images/${item.favImage}.svg"));
    });
  }
}
