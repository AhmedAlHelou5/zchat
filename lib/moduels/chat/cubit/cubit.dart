import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zchat/moduels/chat/cubit/states.dart';
import 'package:zchat/shared/components/components.dart';

class ChatCubit extends Cubit<ChatStates> {
  ChatCubit() : super(ChatInitialState());

  static ChatCubit get(context) => BlocProvider.of(context);


  var controller = TextEditingController();
  var scrollController = ScrollController();
  bool emojiShowing = false;

  void changeEmojiShowing( ) {
    emojiShowing = !emojiShowing!;
    emit(ChatTapEmojiIconState());
  }




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




