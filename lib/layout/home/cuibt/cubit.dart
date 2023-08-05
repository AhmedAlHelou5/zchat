 import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zchat/layout/home/cuibt/states.dart';
import 'package:zchat/moduels/all_chat/all_chat_screen.dart';
import 'package:zchat/moduels/improtant_chat/important_chat_screen.dart';
import 'package:zchat/moduels/read_chat/read_chat_screen.dart';
import 'package:zchat/moduels/unread_chat/unread_chat_screen.dart';
import '../../../shared/components/constants.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
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


  int currentIndex = 0;

  List<Widget> screens = [
    AllChatScreen(),
    ImportantChatScreen(),
    UnreadChatScreen(),
    ReadChatScreen(),
  ];

  List<String> taps = [
    'All Chat',
    'Important Chat',
    'Unread Chat',
    'Read Chat',
  ];




  List<Tab> tapsList = const [
    Tab(
      text: 'All',
    ),
    Tab(
      text: 'Important',
    ),
    Tab(
      text: 'Unread',
    ),
    Tab(
      text: 'Read',
    ),

  ];

  // List<IconButton> actions =  [
  //   IconButton(
  //     onPressed: (){}, icon:SvgPicture.asset('assets/icons/Add.svg',height: 15,width: 15,),
  //   ),
  //   IconButton(
  //     onPressed: (){}, icon:SvgPicture.asset('assets/icons/Search.svg',height: 18,width: 18,),
  //   ),
  //   IconButton(
  //     onPressed: (){}, icon:SvgPicture.asset('assets/icons/Vector.svg',),
  //   ),
  // ];




  void changeTabBar(int index) {
      currentIndex = index;
      emit(HomeChangeTabBarState());
    }

  }



