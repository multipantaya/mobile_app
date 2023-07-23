import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:mobile_app/constants/constants.dart';
import 'package:domain/domain.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());

  initPlatform () {
    final images = [MPYImages.hbo,MPYImages.amazon,MPYImages.disney,MPYImages.youtube,MPYImages.spotify,MPYImages.netflix];
    int index = 0;
    final List<PlatformsModel> platforms = [];
    for (var plan in dataPlatforms) {
      platforms.add(plan.copyWith(image: images[index]));
      index++;
    }
    emit(state.copyWith(platforms: platforms));
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
  }

  pageIndex(int page) => emit(state.copyWith(pageIndex: page));
}
