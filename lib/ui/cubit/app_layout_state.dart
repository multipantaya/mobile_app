part of 'app_layout_cubit.dart';

class AppLayoutState extends Equatable {
  const AppLayoutState ({
    this.tabController = false
  });

  final bool tabController;
  
  @override
  List<Object?> get props => [
    tabController
  ];

  AppLayoutState copyWith({
    bool? tabController
  }){
    return AppLayoutState(
      tabController: tabController ?? this.tabController
    );
  }


}
