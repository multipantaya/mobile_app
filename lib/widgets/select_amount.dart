import 'package:flutter/material.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class SelectAmount extends StatelessWidget {
  final VoidCallback onRemove;
  final VoidCallback onAdd;
  final int totalAmount;
  final TextStyle? textStyle;
  final TextAlign? textAlign;
  const SelectAmount({super.key, required this.onRemove, required this.onAdd, required this.totalAmount, this.textStyle, this.textAlign});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(
          AppLocalizations.of(context)!.accountsToBuy,
          textAlign: textAlign ?? TextAlign.justify,
          style: textStyle ?? AppTheme.textStyles.white16F700,
        )),
        const SizedBox(width: 10,),
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppTheme.colors.primaryColor)
          ),
          child: Row(
            children: [
              IconButtonCustom(
                icon: Icons.remove,
                color: AppTheme.colors.white,
                onPressed: onRemove,
              ),
              const SizedBox(width: 10,),
              Text(
                totalAmount.toString(),
                style: AppTheme.textStyles.white16F500,
              ),
              const SizedBox(width: 10,),
              IconButtonCustom(
                icon: Icons.add,
                color: AppTheme.colors.white,
                onPressed: onAdd,
              ),
            ],
          ),
        )
      ],
    );
  }
}