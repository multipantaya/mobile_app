part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.platforms = const [],
    this.platformsFavorite = const [],
    this.paymentMethos = const [MPYImages.raro,MPYImages.cash,MPYImages.zinli,MPYImages.paypal,MPYImages.chino,MPYImages.zelle],
    this.pageIndex = 0,
    this.objectPlatform
  });

  final List<PlatformsModel> platforms;
  final List<PlatformsModel> platformsFavorite;
  final List<String> paymentMethos;
  final int pageIndex;
  final Box<PlatformData>? objectPlatform;
  
  @override
  List<Object?> get props => [platforms, platformsFavorite,pageIndex, objectPlatform,paymentMethos];

  HomeState copyWith({
    List<PlatformsModel>? platforms,
    List<PlatformsModel>? platformsFavorite,
    List<String>? paymentMethos,
    int? pageIndex,
    Box<PlatformData>? objectPlatform
  }){
    return HomeState(
      platforms: platforms ?? this.platforms,
      platformsFavorite: platformsFavorite ?? this.platformsFavorite,
      paymentMethos: paymentMethos ?? this.paymentMethos,
      pageIndex: pageIndex ?? this.pageIndex,
      objectPlatform: objectPlatform ?? this.objectPlatform
    );
  }
}
