import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/database/information/term_conditons_data.dart';
import 'package:mobile_app/ui/information/information.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';
import 'package:auto_size_text/auto_size_text.dart';

class AlertDialogCheck extends StatefulWidget {
  final String title;
  final String text;
  final void Function()? onTap;
  final String? textButton;
  final Color? colorsCancelButton;
  final Color? colorsButton;
  final String? textButtonCancel;
  final void Function()? onTapCancel;
  final TextAlign textAlign;
  final int maxLines;
  const AlertDialogCheck(
      {super.key,
      required this.title,
      required this.text,
      this.onTap,
      this.textButton,
      this.colorsCancelButton,
      this.textButtonCancel,
      this.onTapCancel,
      this.colorsButton,
      this.textAlign = TextAlign.center,
      this.maxLines = 2
    });

  @override
  State<AlertDialogCheck> createState() => _AlertDialogCheckState();
}

class _AlertDialogCheckState extends State<AlertDialogCheck> {
  late bool aceptTerm = true;
  late bool aceptPolitics = true;
  @override
  Widget build(BuildContext context) {
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
              widget.title,
              textAlign: TextAlign.center,
              maxLines: widget.maxLines,
              maxFontSize: 16,
              minFontSize: 13,
              style: AppTheme.textStyles.white16F700
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: AutoSizeText(
                widget.text,
                textAlign: widget.textAlign,
                maxFontSize: 15,
                minFontSize: 9,
                style: AppTheme.textStyles.white14F500,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Checkbox.adaptive(
                  value: aceptTerm, 
                  onChanged: (value) => setState(() {aceptTerm = value!;}),
                ), 
                const SizedBox(width: 10,),
                Expanded(
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.termAndConditions,
                      recognizer: TapGestureRecognizer()..onTap = (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TermAndConditionsView(
                         title: AppLocalizations.of(context)!.termAndConditions, 
                         data: TermConditionData.dataTerms()
                         )));
                      }
                    ),
                    style: TextStyle(
                     color: AppTheme.colors.white,
                     fontWeight: AppTheme.fontWeight.fW700,
                     fontSize: 16,
                     decoration: TextDecoration.underline,
                     decorationColor: AppTheme.colors.white
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Checkbox.adaptive(
                  value: aceptPolitics, 
                  onChanged: (value) => setState(() {aceptPolitics = value!;}),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: AutoSizeText.rich(
                    TextSpan(
                      text: AppLocalizations.of(context)!.politicsPrivacy,
                      recognizer: TapGestureRecognizer()..onTap = (){
                       Navigator.push(context, MaterialPageRoute(builder: (context) => TermAndConditionsView(
                         title: AppLocalizations.of(context)!.politicsPrivacy, 
                         data: PoliticsData.dataTerms()
                         )));
                      }
                    ),
                    style: TextStyle(
                     color: AppTheme.colors.white,
                     fontWeight: AppTheme.fontWeight.fW700,
                     fontSize: 16,
                     decoration: TextDecoration.underline,
                     decorationColor: AppTheme.colors.white
                    ),
                  )
                )
              ],
            ),
            const SizedBox(height: 15),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: [
                AppButtonMini(
                  onPressed: widget.onTapCancel ?? () => Navigator.pop(context),
                  text: widget.textButtonCancel ?? AppLocalizations.of(context)!.cancel,
                  textAlign: TextAlign.center,
                  primary: (widget.colorsCancelButton) ?? AppTheme.colors.red,
                ),
                AppButtonMini(
                  onPressed: aceptPolitics && aceptTerm
                    ? widget.onTap ?? () => Navigator.pop(context)
                    : null,
                  text: widget.textButton ?? AppLocalizations.of(context)!.sendRequest,
                  textAlign: TextAlign.center,
                  primary: (widget.colorsButton) ?? AppTheme.colors.primaryColor,
                ),
              ],
            )
            
          ]),
        ),
      ),
    );
  }
}
