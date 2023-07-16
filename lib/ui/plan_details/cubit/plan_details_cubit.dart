import 'package:bloc/bloc.dart';
import 'package:domain/domain.dart';
import 'package:equatable/equatable.dart';
part 'plan_details_state.dart';

class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit() : super(const PlanDetailsState());

  serPlatform(PlatformModel platform) => emit(state.copyWith(platform: platform));
}
