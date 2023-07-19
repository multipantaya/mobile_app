import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class CardProduct extends StatelessWidget {
  final ProductModel product;
  const CardProduct({
    super.key, required this.product,
  });

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: AppTheme.shadows.white10
          ),
          child: Column(
            children: [
              ImageDetail(platform: product.platform),
              SelectAmount(
                onRemove: () => cubit.changeTotalAmount(product.id, false), 
                onAdd: () => cubit.changeTotalAmount(product.id, true), 
                totalAmount: product.platform.totalAmount,
                textStyle: AppTheme.textStyles.white14F500,
              ),
            ],
          ),
        )
      ],
    );
  }
}