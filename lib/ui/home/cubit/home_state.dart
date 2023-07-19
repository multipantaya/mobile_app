part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.platforms = const [],
    this.platformsFavorite = const [],
  });

  final List<PlatformsModel> platforms;
  final List<PlatformsModel> platformsFavorite;
  
  @override
  List<Object?> get props => [platforms, platformsFavorite];

  HomeState copyWith({
    List<PlatformsModel>? platforms,
    List<PlatformsModel>? platformsFavorite
  }){
    return HomeState(
      platforms: platforms ?? this.platforms,
      platformsFavorite: platformsFavorite ?? this.platformsFavorite
    );
  }
}
