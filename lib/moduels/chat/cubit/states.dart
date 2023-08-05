abstract class ChatStates {}
class ChatInitialState extends ChatStates {}
class ChatLoadingState extends ChatStates {}
class ChatTapAddIconState extends ChatStates {}
class ChatTapImageIconState extends ChatStates {}
class ChatTapEmojiIconState extends ChatStates {}
class ChatChangeLengthState extends ChatStates {}
class ChatChangeIconToSendState extends ChatStates {
  int length;
  ChatChangeIconToSendState(this.length);
}
class ChatChangeEmojiShowingState extends ChatStates {}
class ChatShowBottomSheetState extends ChatStates {}
class ChatDisableBottomSheetState extends ChatStates {}
