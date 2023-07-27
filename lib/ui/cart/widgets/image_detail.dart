import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class ImageDetail extends StatelessWidget {
  final PlatformsModel platform;
  const ImageDetail({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: SizedBox(
            width: 100,
            height: 100,
            child: MediaUtils().getImageWidget(
              platform.image,
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
                  platform.namePlatform,
                  minFontSize: 12,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: AppTheme.textStyles.white14F700,
                ),
              ),
              const SizedBox(height: 10,),
              AutoSizeText(
                platform.plans.first.namePlan,
                minFontSize: 12,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.justify,
                style: AppTheme.textStyles.white14F500,
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: AutoSizeText(
                      AppLocalizations.of(context)!.subTotal,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.justify,
                      style: AppTheme.textStyles.white14F500,
                    ),
                  ),
                  const SizedBox(width: 5,),
                  Expanded(
                    child: AutoSizeText(
                      '${platform.plans.first.price * platform.totalAmount} USD',
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      textAlign: TextAlign.end,
                      style: AppTheme.textStyles.white14F500,
                    ),
                  ),
                ],
              )
            ],
          )
        )
      ],
    );
  }
}