import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/utils/media_utils.dart';
import 'package:presentation/presentation.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  '¡Disfruta del Entretenimiento sin Límites!',
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyles.titleText,
                ),
                const SizedBox(height: 20,),
                
                if(state.platformsFavorite.isNotEmpty)...[
                  Text(
                    'Tus plataformas favoritas',
                    textAlign: TextAlign.justify,
                    style: AppTheme.textStyles.titleText,
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width,
                      maxHeight: 290
                    ),
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      physics: const BouncingScrollPhysics(),
                      itemCount: state.platformsFavorite.length,
                      separatorBuilder: (context, index) => SizedBox(width: 20,), 
                      itemBuilder: (context, index) => CardPlatform(platform: state.platformsFavorite[index],isFavorite: true), 
                    )
                  ),
                ]else...[
                  Container(
                    height: 330,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MediaUtils().getImageWidget(
                          MPYImages.logo,
                          useFileImage: false,
                          height: 100
                        ),
                        Text(
                          'No tienes favoritos agregados',
                          textAlign: TextAlign.center,
                          style: AppTheme.textStyles.titleText,
                        ),
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 20,),
                Text(
                  'Todas nuestras plataformas',
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyles.titleText,
                ),
                const SizedBox(height: 20,),
                Wrap(
                  runSpacing: 20,
                  spacing: 15,
                  children: state.platforms.map((e) => CardPlatform(platform: e,isFavorite: false,)).toList(),
                ),
                const SizedBox(height: 20,),
              ],
            )
          ), 
        );
      },
    );
  }
}