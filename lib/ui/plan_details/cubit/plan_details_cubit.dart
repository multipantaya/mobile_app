import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
part 'plan_details_state.dart';

class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit() : super(const PlanDetailsState());

  setPlatform(PlatformModel platform) => emit(state.copyWith(platform: platform, plan: platform.plans.first));

  setPlan(String plan) {
    for (var plans in state.platform!.plans) {
      if(plan == plans.namePlan){
        emit(state.copyWith(plan: plans));
        break;
      }
    }
  }
  
}
