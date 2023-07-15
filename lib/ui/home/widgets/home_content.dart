import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:presentation/presentation.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              return Column(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '¡Disfruta del Entretenimiento sin Límites!',
                    textAlign: TextAlign.center,
                    style: AppTheme.textStyles.titleText,
                  ),
                  const SizedBox(height: 40,),
                  
                  if(state.platformsFavorite.isNotEmpty)...[
                    Text(
                      'Tus plataformas favoritas',
                      textAlign: TextAlign.justify,
                      style: AppTheme.textStyles.titleText,
                    ),
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width,
                        maxHeight: 400
                      ),
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        physics: const BouncingScrollPhysics(),
                        itemCount: state.platformsFavorite.length,
                        separatorBuilder: (context, index) => SizedBox(width: 20,), 
                        itemBuilder: (context, index) => CardPlatform(platform: state.platformsFavorite[index],), 
                      )
                    ),
                  ]else...[
                    Text(
                      'No tienes favoritos agregados',
                      textAlign: TextAlign.center,
                      style: AppTheme.textStyles.titleText,
                    ),
                  ],
                  const SizedBox(height: 40,),
                  Text(
                    'Todas nuestras plataformas',
                    textAlign: TextAlign.center,
                    style: AppTheme.textStyles.titleText,
                  ),
                  const SizedBox(height: 20,),
                  Wrap(
                    runSpacing: 20,
                    spacing: 15,
                    children: state.platforms.map((e) => CardPlatform(platform: e,)).toList(),
                  ),
                  const SizedBox(height: 20,),
                ],
              );
            },
          ),
        ), 
      ),
    );
  }
}