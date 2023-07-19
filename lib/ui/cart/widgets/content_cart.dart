import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/cart/cart.dart';

class ContentCart extends StatelessWidget {
  const ContentCart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: state.products.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) => SizedBox(height: 15,), 
                itemBuilder: (context, index) {
                  return CardProduct(product: state.products[index]);
                }, 
              )
            )
          ],
        );
      },
    );
  }
}
