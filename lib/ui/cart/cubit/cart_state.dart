part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
    this.total = 0
  });

  final List<ProductModel> products;
  final double total;
  
  @override
  List<Object?> get props => [
    products,total
  ];

  CartState copyWith({
    List<ProductModel>? products,
    double? total

  }){
    return CartState(
      products: products ?? this.products,
      total: total ?? this.total
    );
  }


}
