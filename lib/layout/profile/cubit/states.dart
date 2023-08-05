abstract class ProfileStates {}
class ProfileInitialState extends ProfileStates {}
class ProfileLoadingState extends ProfileStates {}
class ProfileSuccessState extends ProfileStates {}
class ProfileErrorState extends ProfileStates {
  final String error;
  ProfileErrorState(this.error);
}
//
// class HomeGetUserSuccessState extends HomeStates {}
// class HomeGetUserLoadingState extends HomeStates {}
// class HomeGetUserErrorState extends HomeStates {
//   final String error;
//   HomeGetUserErrorState(this.error);
// }

class ProfileChangeTabBarState extends ProfileStates {}
