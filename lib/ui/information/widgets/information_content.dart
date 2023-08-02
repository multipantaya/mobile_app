import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/database/information/term_conditons_data.dart';
import 'package:mobile_app/ui/information/information.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class InformationContent extends StatelessWidget {
  const InformationContent({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!; 
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text(
            texts.paymentMethod,
            textAlign: TextAlign.center,
            style: AppTheme.textStyles.titleText,
          ),
        ),
        const SizedBox(height: 10,),
        ...texts.paymentMethodText.split('*').map((e) => 
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Text(
              '✓ $e',
              style: AppTheme.textStyles.white16F400,
            ),
          )
        ).toList(),
        const SizedBox(height: 5,),
        Center(
          child: Text(
            texts.howToBuy,
            textAlign: TextAlign.center,
            style: AppTheme.textStyles.titleText,
          ),
        ),
        const SizedBox(height: 10,),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: texts.stepOne,
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
              text: texts.stepOneText,
              style: AppTheme.textStyles.white16F400
             )
            ]
          )
        ),
        SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: texts.stepTwo,
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
              text: texts.stepTwoText,
              style: AppTheme.textStyles.white16F400
             )
            ]
          )
        ),
        SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: texts.stepThree,
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
              text: texts.stepThreeText,
              style: AppTheme.textStyles.white16F400
             )
            ]
          )
        ),
        SizedBox(height: 10),
        RichText(
          textAlign: TextAlign.justify,
          text: TextSpan(
            text: texts.stepFour,
            style: AppTheme.textStyles.white16F700,
            children: [
             TextSpan(
               text: ': ${texts.stepFourText} ',
               style: AppTheme.textStyles.white16F400
              ),
              TextSpan(
               text: texts.termAndConditions.toLowerCase(),
               style: TextStyle(
                color: AppTheme.colors.white,
                fontWeight: AppTheme.fontWeight.fW700,
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationColor: AppTheme.colors.white
               ),
               recognizer: TapGestureRecognizer()..onTap = (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermAndConditionsView(
                  title: AppLocalizations.of(context)!.termAndConditions, 
                  data: TermConditionData.dataTerms()
                  )));
               }
              ),
              TextSpan(
               text: ' ${texts.stepFourTextComplement}. ',
               style: AppTheme.textStyles.white16F400
              ), 
              TextSpan(
               text: '${texts.stepSix}'  , 
               style: AppTheme.textStyles.white16F400
              ),
              TextSpan(
               text: texts.politicsPrivacy.toLowerCase(),
               style: TextStyle(
                color: AppTheme.colors.white,
                fontWeight: AppTheme.fontWeight.fW700,
                fontSize: 16,
                decoration: TextDecoration.underline,
                decorationColor: AppTheme.colors.white
               ),
               recognizer: TapGestureRecognizer()..onTap = (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => TermAndConditionsView(
                  title: AppLocalizations.of(context)!.politicsPrivacy, 
                  data: PoliticsData.dataTerms()
                  )));
               }
              ),
              TextSpan(
               text: ' ${texts.stepSixText}'  , 
               style: AppTheme.textStyles.white16F400
              ),
            ]
          )
        ),
      ],
    );
  }
}