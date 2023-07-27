import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/widgets/widgets.dart';
import 'package:presentation/presentation.dart';

class BottonNavigationBar extends StatelessWidget {
  const BottonNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final texts = AppLocalizations.of(context)!;
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Container(
          decoration: BoxDecoration(
            boxShadow: AppTheme.shadows.white10,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
            child: BottomNavigationBar(
              backgroundColor: AppTheme.colors.background,
              elevation: 0,
              selectedItemColor: AppTheme.colors.primaryColor,
              unselectedItemColor: AppTheme.colors.white.withOpacity(0.3),
              onTap: (value) => context.read<HomeCubit>().pageIndex(value),
              currentIndex: state.pageIndex,
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,size: 30),
                  label: texts.principal,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite,size: 30),
                  label: texts.favorite,
                ),
              ]
            ),
          ),
        );
      },
    );
  }
}