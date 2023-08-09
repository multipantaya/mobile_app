import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/ui/plan_details/plan_details.dart';
import 'package:mobile_app/utils/media_utils.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class CardPlatform extends StatelessWidget {
  final PlatformsModel platform;
  final bool isFavorite;
  const CardPlatform({super.key, required this.platform, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final cubit = context.read<PlanDetailsCubit>();
    final texts = AppLocalizations.of(context)!;
    return Container(
      width: isFavorite
        ? 200
        : width > 300 ? 300 : width * 0.9,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        boxShadow: AppTheme.shadows.white10,
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.colors.background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Hero(
            tag: platform.id,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
              child: MediaUtils().getImageWidget(
                platform.image,
                useFileImage: false,
                fit:BoxFit.cover,
                height: isFavorite ? 150 : 200
              ),
            ),
          ),

          const SizedBox(height: 10,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Row(
              children: [
                Expanded(
                  child: AutoSizeText(
                    platform.namePlatform,
                    minFontSize: 14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: isFavorite ? AppTheme.textStyles.white14F700: AppTheme.textStyles.titleText,
                  ),
                ),
                const SizedBox(width: 10,),
                IconButtonCustom(
                  icon: platform.favorite ? Icons.favorite : Icons.favorite_border,
                  color: platform.favorite ? AppTheme.colors.primaryColor : AppTheme.colors.white,
                  size: isFavorite ? 24 : 30,
                  onPressed: () {
                    final cubit = context.read<HomeCubit>();
                    cubit.favoritePlatform(id: platform.id);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 5,),

          if(!isFavorite)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    texts.discoverPlans,
                    maxLines: 1,
                    style: AppTheme.textStyles.white14F700,
                  ),
                  const SizedBox(height: 5,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: platform.plans.map((e) => Text(
                            '✓ ${e.namePlan}',
                            maxLines: 1,
                            textAlign: TextAlign.justify,
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.textStyles.white14F400,
                          )).toList(),
                        )
                      ),
                      const SizedBox(width: 10,),
                      AppButtonMini(
                        text: texts.viewPlans,
                        onPressed: () {
                          cubit.setPlatform(platform);
                          Navigator.push(context, MaterialPageRoute(builder: (context) => PlanDetailsView()));
                        },
                      ),
                    ],
                  ),
                ],
              ),
            )
            else
              AppButton(
                name: texts.viewPlans,
                onPressed: () {
                  cubit.setPlatform(platform);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PlanDetailsView()));
                },
              ),
          
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}