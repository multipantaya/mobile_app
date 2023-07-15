import 'package:auto_size_text/auto_size_text.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/utils/media_utils.dart';
import 'package:presentation/presentation.dart';

class CardPlatform extends StatelessWidget {
  final PlatformModel platform;
  const CardPlatform({super.key, required this.platform});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width > 300 ? 300 : width * 0.9,
      alignment: Alignment.topCenter,
      decoration: BoxDecoration(
        boxShadow: AppTheme.shadows.white10,
        borderRadius: BorderRadius.circular(10),
        color: AppTheme.colors.background
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10)),
            child: MediaUtils().getImageWidget(
              platform.image,
              useFileImage: false,
              fit: BoxFit.contain
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
                    minFontSize: 18,
                    maxLines: 1,
                    style: AppTheme.textStyles.titleText,
                  ),
                ),
                const SizedBox(width: 10,),
                IconButtonCustom(
                  icon: platform.favorite ? Icons.favorite : Icons.favorite_border,
                  color: platform.favorite ? AppTheme.colors.primaryColor : AppTheme.colors.white,
                  size: 30,
                  onPressed: () {
                    final cubit = context.read<HomeCubit>();
                    cubit.favoritePlatform(id: platform.id);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 5,),
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Conoce nuestros planes',
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
                          style: AppTheme.textStyles.white14F400,
                        )).toList(),
                      )
                    ),
                    const SizedBox(width: 10,),
                    AppButtonMini(
                      text: 'Ver planes',
                      onPressed: () {
                        
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}