part of 'cart_cubit.dart';

class CartState extends Equatable {
  const CartState({
    this.products = const [],
    this.objetProducts,
    this.total = 0
  });

  final List<ProductModel> products;
  final double total;
  final Box<CartData>? objetProducts;
  
  @override
  List<Object?> get props => [
    products,total,objetProducts
  ];

  CartState copyWith({
    List<ProductModel>? products,
    Box<CartData>? objetProducts,
    double? total

  }){
    return CartState(
      products: products ?? this.products,
      objetProducts: objetProducts ?? this.objetProducts,
      total: total ?? this.total
    );
  }
}
