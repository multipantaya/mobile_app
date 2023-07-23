part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.platforms = const [],
    this.platformsFavorite = const [],
    this.pageIndex = 0,
    this.objectPlatform
  });

  final List<PlatformsModel> platforms;
  final List<PlatformsModel> platformsFavorite;
  final int pageIndex;
  final Box<PlatformData>? objectPlatform;
  
  @override
  List<Object?> get props => [platforms, platformsFavorite,pageIndex, objectPlatform];

  HomeState copyWith({
    List<PlatformsModel>? platforms,
    List<PlatformsModel>? platformsFavorite,
    int? pageIndex,
    Box<PlatformData>? objectPlatform
  }){
    return HomeState(
      platforms: platforms ?? this.platforms,
      platformsFavorite: platformsFavorite ?? this.platformsFavorite,
      pageIndex: pageIndex ?? this.pageIndex,
      objectPlatform: objectPlatform ?? this.objectPlatform
    );
  }
}
