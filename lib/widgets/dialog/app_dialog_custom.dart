import 'package:flutter/material.dart';
// import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AlertDialogCustom extends StatelessWidget {
  final String title;
  final String text;
  final void Function()? onTap;
  final String? textButton;
  final bool needTwoButtons;
  final Color? colorsCancelButton;
  final Color? colorsButton;
  final String? textButtonCancel;
  final void Function()? onTapCancel;
  final TextAlign textAlign;
  final int maxLines;
  const AlertDialogCustom(
      {super.key,
      required this.title,
      required this.text,
      this.onTap,
      this.textButton,
      this.needTwoButtons = false,
      this.colorsCancelButton,
      this.textButtonCancel,
      this.onTapCancel,
      this.colorsButton,
      this.textAlign = TextAlign.center,
      this.maxLines = 2
    });

  @override
  Widget build(BuildContext context) {
    // final texts = AppLocalizations.of(context)!;
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 10,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppTheme.colors.background,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
          child: Column(
            children: [
            const SizedBox(height: 10),
            AutoSizeText(
              title,
              textAlign: TextAlign.center,
              maxLines: maxLines,
              maxFontSize: 16,
              minFontSize: 13,
              style: AppTheme.textStyles.white16F700
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                text,
                textAlign: textAlign,
                maxFontSize: 15,
                minFontSize: 9,
                style: AppTheme.textStyles.white14F500,
              ),
            ),
            const SizedBox(height: 15),
            if (needTwoButtons)
              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                children: [
                  AppButtonMini(
                    onPressed: onTapCancel ?? () => Navigator.pop(context),
                    text: textButtonCancel ?? 'Cancelar',
                    textAlign: TextAlign.center,
                    primary: (colorsCancelButton) ?? AppTheme.colors.red,
                  ),
                  AppButtonMini(
                    onPressed: onTap ?? () => Navigator.pop(context),
                    text: textButton ?? 'Enviar pedido',
                    textAlign: TextAlign.center,
                    primary: (colorsButton) ?? AppTheme.colors.primaryColor,
                  ),
                ],
              )
            else
              AppButtonMini(
                onPressed: onTap ?? () => Navigator.pop(context),
                text: textButton ?? 'Aceptar',
                textAlign: TextAlign.center,
                primary: (colorsButton) ?? AppTheme.colors.primaryColor,
              ),
            
          ]),
        ),
      ),
    );
  }
}
