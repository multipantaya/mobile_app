import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
part 'plan_details_state.dart';

class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit() : super(const PlanDetailsState());

  setPlatform(PlatformsModel platform) => emit(state.copyWith(platform: platform, plan: platform.plans.first));

  setPlan(String plan) {
    for (var plans in state.platform!.plans) {
      if(plan == plans.namePlan){
        emit(state.copyWith(plan: plans));
        break;
      }
    }
  }

  ChangeTotalAmount (bool isAdd) {
    if(isAdd){
      emit(state.copyWith(platform: state.platform!.copyWith(totalAmount: state.platform!.totalAmount + 1)));
    }else{
      if(state.platform!.totalAmount > 1){
        emit(state.copyWith(platform: state.platform!.copyWith(totalAmount: state.platform!.totalAmount - 1)));
      }
    }
  }

}
