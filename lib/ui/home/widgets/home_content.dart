import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:presentation/presentation.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

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
                  Text(
                    '¡Disfruta del Entretenimiento sin Límites!',
                    textAlign: TextAlign.center,
                    style: AppTheme.textStyles.titleText,
                  ),
                  const SizedBox(height: 20,),
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