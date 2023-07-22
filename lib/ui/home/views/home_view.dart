import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/ui/home/home.dart';
import 'package:mobile_app/widgets/main_appbar.dart';

class HomeView extends StatelessWidget {
  static const routeName = 'home_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return IndexedStack(
              index: state.pageIndex,
              children: [
               HomeContent(),
               FavoriteContent()
              ],
            );
        },
      ),
      bottomNavigationBar: BottonNavigationBar(),
   );
  }
}
