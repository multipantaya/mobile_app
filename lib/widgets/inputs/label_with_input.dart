import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class LabelWithInput extends StatelessWidget {
  const LabelWithInput({
    Key? key,
    required this.input, required this.textInput,
  }) : super(key: key);

  final Widget input;
  final String textInput;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: AutoSizeText.rich(
              TextSpan(
                text: '* ',
                style: AppTheme.textStyles.white14F700,
                children: [
                  TextSpan(
                    text: textInput,
                    style: AppTheme.textStyles.white14F700
                  )
                ]
              )
            )
          )
        ),
        const SizedBox(height: 5,),
        input
      ],
    );
  }
}
