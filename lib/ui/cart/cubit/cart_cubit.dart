import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  addToCart (PlatformsModel platform) {
    List<ProductModel> newPlatforms = [];
    for (var product in state.products) {
      newPlatforms.add(product);
    }
    newPlatforms.add(ProductModel(
      id: DateTime.now().toIso8601String(), 
      platform: platform
    ));
    emit(state.copyWith(products: newPlatforms));
  }

  changeTotalAmount(String id, bool isAdd){
    List<ProductModel> newProducts = [];
    for (var product in state.products) {
      if(product.id == id){
        if(isAdd){
          newProducts.add(
            product.copyWith(
              platform: product.platform.copyWith(
                totalAmount: product.platform.totalAmount + 1
              )
            )
          );
        }else{
          if(product.platform.totalAmount > 1){
            newProducts.add(
              product.copyWith(
                platform: product.platform.copyWith(
                  totalAmount: product.platform.totalAmount - 1
                )
              )
            );
          }else{
            newProducts.add(product);
          }
        }
      }else{
        newProducts.add(product);
      }
    }
    emit(state.copyWith(products: newProducts));
  }
}
