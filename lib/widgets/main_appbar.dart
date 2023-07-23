import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:mobile_app/ui/cart/cart.dart';
import 'package:mobile_app/ui/information/information.dart';
import 'package:mobile_app/utils/utils.dart';
import 'package:presentation/presentation.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    Key? key, this.enableActions = true, this.enableInfo = true
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
      super(key: key);
  @override
  MainAppBarState createState() => MainAppBarState();

  @override
  final Size preferredSize;
  final bool enableActions;
  final bool enableInfo;
}

class MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        return AppBar(
          backgroundColor: AppTheme.colors.background,
          elevation: 0,
          
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MediaUtils().getImageWidget(
                MPYImages.logo,
                useFileImage: false,
                width: 30,
                height: 30,
                fit: BoxFit.contain,
                color: AppTheme.colors.white.withOpacity(0.5)
              ),
              const SizedBox(width: 5,),
              AutoSizeText(
                'MultiPantaya',
                maxLines: 1,
                minFontSize: 14,
                style: AppTheme.textStyles.titleTextAppbar
              ),
            ],
          ),
          actions: [
            if(widget.enableActions)...[
              Stack(
                alignment: Alignment.center,
                children: [
                  IconButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CartView())), 
                    icon: Icon(Icons.shopping_bag_outlined),
                    visualDensity: VisualDensity.compact,
                    splashRadius: 18,
                  ),
                  if(state.products.isNotEmpty)
                    Positioned(
                      top: 6,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        constraints: BoxConstraints(
                          maxHeight: 20,
                          maxWidth: 20
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: AppTheme.colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: AutoSizeText(
                          state.products.length.toString(),
                          maxLines: 1,
                          minFontSize: 10,
                          style: AppTheme.textStyles.primaryColor12F500,
                        ),
                      ),
                    )
                ],
              ),
            ],
            if(widget.enableInfo)...[
              IconButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => InformationView())), 
                icon: Icon(Icons.info_outline),
                visualDensity: VisualDensity.compact,
                splashRadius: 18,
              ),
              const SizedBox(width: 10,),
            ]
          ],
        );
      },
    );
  }
}
