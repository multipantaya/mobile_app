import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'information_state.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationCubit() : super(InformationInitial());
}
