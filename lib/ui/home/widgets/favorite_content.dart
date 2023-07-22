import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/utils/media_utils.dart';
import 'package:presentation/presentation.dart';

class FavoriteContent extends StatelessWidget {
  const FavoriteContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      '¡Tus plataformas favoritas!',
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyles.titleText,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  if(state.platformsFavorite.isNotEmpty)...[
                    Wrap(
                      runSpacing: 20,
                      spacing: 15,
                      children: state.platformsFavorite.map((e) => CardPlatform(platform: e,isFavorite: false,)).toList(),
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
                  const SizedBox(height: 30,),
                ],
              )
            ), 
          ),
        );
      },
    );
  }
}