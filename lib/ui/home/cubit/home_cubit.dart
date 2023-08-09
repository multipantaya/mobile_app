import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:domain/domain.dart';
import 'package:mobile_app/database/database.dart';
import 'package:mobile_app/widgets/widgets.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  initPlatform (AppLocalizations texts) {
    final images = [MPYImages.netflix,MPYImages.spotify,MPYImages.youtube,MPYImages.disney,MPYImages.hbo,MPYImages.hbo,MPYImages.amazon,];
    int index = 0;
    List<PlatformsModel> platforms = [];
    List<PlatformsModel> platformsFavorite = [];
    for (var plan in InfoPlatform.dataPlatforms(texts)) {
      platforms.add(plan.copyWith(image: images[index]));
      index++;
    }
    
    final objetPlatform = Hive.box<PlatformData>(MPYKeys.boxPlatforms);
    final savePlat = objetPlatform.get(0)?.platforms ?? [];
    if(savePlat.isEmpty){
      objetPlatform.clear();
      objetPlatform.add(PlatformData(platforms: platforms));
    }else{
      platforms = savePlat;
    }

    for (var plat in platforms) {
      if(plat.favorite){
        platformsFavorite.add(plat.copyWith(id: '${plat.id+'F'}'));
      }
    }
    emit(state.copyWith(
      platforms: platforms,
      platformsFavorite: platformsFavorite,
      objectPlatform: objetPlatform
    ));
  }

  favoritePlatform ({required String id}) {
    List<PlatformsModel> newPlatform = [];
    List<PlatformsModel> newPlatformFavorte = [];

    for (var platform in state.platforms) {
      if(platform.id == id.replaceAll('F', '')) {
        newPlatform.add(platform.copyWith(favorite: !platform.favorite));
      }else{
        newPlatform.add(platform);
      }
    }
    for (var platform in newPlatform) {
      if(platform.favorite) {
        newPlatformFavorte.add(platform.copyWith(id: '${platform.id+'F'}'));
      }
    }
    emit(state.copyWith(platforms: newPlatform,platformsFavorite: newPlatformFavorte));
    replaceData();
  }

  pageIndex(int page) => emit(state.copyWith(pageIndex: page));

  replaceData({bool replace = true}){
    if(replace){
      if(state.objectPlatform!.isNotEmpty){
        state.objectPlatform!.putAt(0,PlatformData(platforms: state.platforms));
      }
    }
  }
}
