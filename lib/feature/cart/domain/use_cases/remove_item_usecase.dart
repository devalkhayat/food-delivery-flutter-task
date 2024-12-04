import 'package:food_delivery_app/feature/cart/domain/entities/cart_item_entity.dart';

import '../repo/cart_repository.dart';

class RemoveItemUseCase{
  final CartRepository cartRepository;
  RemoveItemUseCase({required this.cartRepository});
  call(int id){
    return cartRepository.removeItem(id);
  }
}