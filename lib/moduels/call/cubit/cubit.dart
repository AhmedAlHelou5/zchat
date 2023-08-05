import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zchat/moduels/call/cubit/states.dart';

class CallCubit extends Cubit<CallStates> {
  CallCubit() : super(CallInitialState());

  static CallCubit get(context) => BlocProvider.of(context);
  //
  // UserModel? model;
  //
  // void getUserData() {
  //   emit(HomeGetUserLoadingState());
  //   FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
  //     model = UserModel.fromJson(value.data()!);
  //     emit(HomeGetUserSuccessState());
  //
  //
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(HomeErrorState(error.toString()));
  //   });

  // }


  // int currentIndex = 0;
  //
  //
  // void changeTabBar(int index) {
  //   currentIndex = index;
  //   emit(HomeChangeTabBarState());
  // }

}



