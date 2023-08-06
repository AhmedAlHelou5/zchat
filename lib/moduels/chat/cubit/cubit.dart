import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zchat/models/user/user_model.dart';
import 'package:zchat/moduels/chat/cubit/states.dart';
import 'package:zchat/shared/components/components.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);
  UserModel? model;


  var controller = TextEditingController();
  var scrollController = ScrollController();
  bool emojiShowing = false;

  void changeEmojiShowing( ) {
    emojiShowing = !emojiShowing!;
    emit(ChatTapEmojiIconState());
  }

  List<PopupMenuItem> menu = [
    PopupMenuItem(
      child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/call-svgrepo-com.svg',
          allowDrawingOutsideViewBox: true,height: 24,width: 24,
          color: Colors.white),title: 'Calls',
          color: Colors.white,weight: FontWeight.w600,fontSize:18),
    ),
    PopupMenuItem(
      child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/Delete.svg',
          allowDrawingOutsideViewBox: true,height: 24,width: 24,
          color: Colors.white),title: 'Delete chat history',
          color: Colors.white,weight: FontWeight.w600,fontSize:16 ),
    ),
    PopupMenuItem(
      child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/notification1.svg',
          allowDrawingOutsideViewBox: true,height: 24,width: 24,
          color: Colors.white),title: 'Mute notification',
          color: Colors.white,weight: FontWeight.w600,fontSize:18),
    ),
    PopupMenuItem(
      child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/Search.svg',
          allowDrawingOutsideViewBox: true,height: 24,width: 24,
          color: Colors.white),title: 'Search',
          color: Colors.white,weight: FontWeight.w600,fontSize:18),
    ),
  ];



  void showBottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,

        builder: (builder) {
          return   buildBottomSheetAttachFile(context);

        });
    emit(ChatShowBottomSheetState());
  }


  void changeToSend() {
    if (controller.text.isNotEmpty) {
      emit(ChatChangeIconToSendState(controller.text.length));
    } else {
      emit(ChatChangeLengthState());
    }
  }

  void changeLength(int length) {
    if (length > 0)
      emit(ChatChangeIconToSendState(length));
    if (length == 0)
      emit(ChatChangeLengthState());
  }

}




