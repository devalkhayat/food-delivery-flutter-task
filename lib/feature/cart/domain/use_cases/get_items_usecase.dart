import 'package:food_delivery_app/feature/cart/domain/repo/cart_repository.dart';

class GetItemsUseCase {
  final CartRepository cartRepository;
  GetItemsUseCase({required this.cartRepository});
  call(){
    return cartRepository.getItems();
  }
}