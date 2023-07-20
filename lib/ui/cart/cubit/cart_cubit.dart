import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState());

  addToCart (PlatformsModel platform) {
    List<ProductModel> newPlatforms = [];
    bool exist = false;
    for (var product in state.products) {
      if(product.platform.plans.first.id == platform.plans.first.id){
        exist = true;
        newPlatforms.add(
          product.copyWith(platform: product.platform.copyWith(
            totalAmount: platform.totalAmount + product.platform.totalAmount
          ))
        );
      }else{
        newPlatforms.add(product);
      }
    }
    if(!exist){
      newPlatforms.add(ProductModel(
        id: DateTime.now().toIso8601String(), 
        platform: platform
      ));
    }
    emit(state.copyWith(products: newPlatforms));
    updateTotalPrice();
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
    updateTotalPrice();
  }

  updateTotalPrice(){
    double total = 0;
    for (var product in state.products) {
      total = total + (product.platform.totalAmount * product.platform.plans.first.price);
    }
    emit(state.copyWith(total: total));
  }
}
