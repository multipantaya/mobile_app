part of 'plan_details_cubit.dart';

class PlanDetailsState extends Equatable {
  const PlanDetailsState({
    this.platform
  });

  final PlatformModel? platform;

  @override
  List<Object?> get props => [
    platform
  ];

  PlanDetailsState copyWith({
    PlatformModel? platform
  }){
    return PlanDetailsState(
      platform: platform ?? this.platform
    );
  }
}
