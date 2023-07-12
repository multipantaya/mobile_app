import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class TitleTextCustom extends StatelessWidget {
  final String title;
  final bool center;
  final bool isSpacing;
  const TitleTextCustom({super.key, required this.title, this.center = false,  this.isSpacing = false});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        if(isSpacing)
          SizedBox(height: size.height * 0.05,),
        AutoSizeText(
          title,
          textAlign: center ? TextAlign.center : TextAlign.justify,
          minFontSize: 14,
          maxLines: 1,
          style: AppTheme.textStyles.titleText,
        ),
      ],
    );
  }
}