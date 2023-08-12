import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                Text(
                  texts.unlimitedTraining,
                  textAlign: TextAlign.center,
                  style: AppTheme.textStyles.titleText,
                ),
                const SizedBox(height: 20,),
                const SizedBox(height: 20,),
                Text(
                  texts.allPlatforms,
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
        );
      },
    );
  }
}