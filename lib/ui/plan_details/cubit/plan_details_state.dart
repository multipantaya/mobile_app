part of 'plan_details_cubit.dart';

class PlanDetailsState extends Equatable {
  const PlanDetailsState({
    this.platform,
    this.plan
  });

  final PlatformModel? platform;
  final PlansModel? plan;

  @override
  List<Object?> get props => [
    platform,plan
  ];

  PlanDetailsState copyWith({
    PlatformModel? platform,
    PlansModel? plan
  }){
    return PlanDetailsState(
      platform: platform ?? this.platform,
      plan: plan ?? this.plan
    );
  }
}
