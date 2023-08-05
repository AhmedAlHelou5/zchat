abstract class HomeStates {}
class HomeInitialState extends HomeStates {}
class HomeLoadingState extends HomeStates {}
class HomeSuccessState extends HomeStates {}
class HomeErrorState extends HomeStates {
  final String error;
  HomeErrorState(this.error);
}
//
// class HomeGetUserSuccessState extends HomeStates {}
// class HomeGetUserLoadingState extends HomeStates {}
// class HomeGetUserErrorState extends HomeStates {
//   final String error;
//   HomeGetUserErrorState(this.error);
// }

class HomeChangeTabBarState extends HomeStates {}
