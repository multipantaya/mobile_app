import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '¿Cómo Comprar?',
          textAlign: TextAlign.center,
          style: AppTheme.textStyles.titleText,
        ),
        const SizedBox(height: 10,),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: '1. Explora nuestros productos: ',
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
              text: 'Navega a través de nuestra amplia selección de productos y encuentra lo que necesitas.',
              style: AppTheme.textStyles.white16F400
             )
            ]
          )
        ),
        SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: '2. Añade al carrito: ',
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
              text: 'Haz clic en el botón "Agregar al carrito" para seleccionar los productos que deseas comprar.',
              style: AppTheme.textStyles.white16F400
             )
            ]
          )
        ),
        SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: '3. Revisa tu carrito: ',
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
              text: 'Ve al carrito de compras para verificar los artículos seleccionados y ajustar las cantidades si es necesario.',
              style: AppTheme.textStyles.white16F400
             )
            ]
          )
        ),
      ],
    );
  }
}