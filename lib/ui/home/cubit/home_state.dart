part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.platforms = const [],
    this.platformsFavorite = const [],
  });

  final List<PlatformModel> platforms;
  final List<PlatformModel> platformsFavorite;
  
  @override
  List<Object?> get props => [platforms, platformsFavorite];

  HomeState copyWith({
    List<PlatformModel>? platforms,
    List<PlatformModel>? platformsFavorite
  }){
    return HomeState(
      platforms: platforms ?? this.platforms,
      platformsFavorite: platformsFavorite ?? this.platformsFavorite
    );
  }
}
