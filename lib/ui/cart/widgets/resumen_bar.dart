import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class ResumenBar extends StatelessWidget {
  final double totalPrice;
  const ResumenBar({super.key, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        boxShadow: AppTheme.shadows.white10,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              children: [
                AutoSizeText(
                  'Total a pagar del pedido',
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: AppTheme.textStyles.white14F500,
                ),
                const SizedBox(height: 5,),
                AutoSizeText(
                  '\$${totalPrice} USD',
                  maxLines: 1,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.justify,
                  style: AppTheme.textStyles.white14F500,
                ),
              ],
            )
          ),
          const SizedBox(width: 10,),
          AppButtonMini(
            onPressed: () {
              
            }, 
            text: 'Realizar pedido'
          )
        ],
      ),
    );
  }
}