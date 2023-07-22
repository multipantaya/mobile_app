part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.platforms = const [],
    this.platformsFavorite = const [],
    this.pageIndex = 0
  });

  final List<PlatformsModel> platforms;
  final List<PlatformsModel> platformsFavorite;
  final int pageIndex;
  
  @override
  List<Object?> get props => [platforms, platformsFavorite,pageIndex];

  HomeState copyWith({
    List<PlatformsModel>? platforms,
    List<PlatformsModel>? platformsFavorite,
    int? pageIndex
  }){
    return HomeState(
      platforms: platforms ?? this.platforms,
      platformsFavorite: platformsFavorite ?? this.platformsFavorite,
      pageIndex: pageIndex ?? this.pageIndex
    );
  }
}
