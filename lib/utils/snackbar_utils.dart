import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';

class SnackbarUtils {
  SnackbarUtils();
  static void popupSnackBar({
    required BuildContext context,
    required String text
  }){
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppTheme.colors.primaryColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        content: AutoSizeText(
          text,
          minFontSize: 10,
          textAlign: TextAlign.center,
          style: AppTheme.textStyles.white14F500,
          maxLines: 2,
        ),
      )
    );
  }
}
