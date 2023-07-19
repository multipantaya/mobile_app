import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/utils/media_utils.dart';
import 'package:presentation/presentation.dart';

class ContentCart extends StatelessWidget {
  const ContentCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            boxShadow: AppTheme.shadows.white10
          ),
          child: Row(
            children: [

              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: MediaUtils().getImageWidget(
                    MPYImages.amazon,
                    useFileImage: false,
                    fit: BoxFit.cover
                  ),
                ),
              ),

              const SizedBox(width: 10,),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: AutoSizeText(
                        'PRIME VIDEO',
                        minFontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: AppTheme.textStyles.white14F700,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    AutoSizeText(
                      'Plan Basico',
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      style: AppTheme.textStyles.white14F700,
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        
                      ],
                    )
                  ],
                )
              )
            ],
          ),
        )
      ],
    );
  }
}