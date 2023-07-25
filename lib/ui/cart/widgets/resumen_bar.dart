import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:presentation/presentation.dart';

class ResumenBar extends StatelessWidget {
  final double totalPrice;
  final List<ProductModel> products;
  const ResumenBar({super.key, required this.totalPrice, required this.products});

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
              String title = 'Hola soy Juan Pablo Carrillo Gamarra y quiero realizar el siguiente pedido: \n\n';
              for (var product in products) {
                title = title + '✓ ${product.platform.totalAmount} ${product.platform.totalAmount == 1 ? 'Cuenta' : 'Cuentas'}  ${product.platform.namePlatform} en plan ${product.platform.plans.first.namePlan} \n';
              }
              title = title + '\n Total a pagar: ${totalPrice} USD';
              LinksAppUtils().openLinkApp(
                context: context,
                url: 'https://wa.me/18482367939?text=$title'
              );
            }, 
            text: 'Realizar pedido'
          )
        ],
      ),
    );
  }
}