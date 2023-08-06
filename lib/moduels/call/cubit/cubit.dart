import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zchat/moduels/call/cubit/states.dart';

class CallCubit extends Cubit<CallStates> {
  CallCubit() : super(CallInitialState());

  static CallCubit get(context) => BlocProvider.of(context);

  int? timeCount = 0;
  String? timeString = "";
  late Timer timer;
  Duration duration = Duration();


  void addTime() {
    final addSeconds = 1;
    emit(CallStartState());
    timeCount = duration.inSeconds + addSeconds;
    duration = Duration(seconds:timeCount!);
    print(duration);
    emit(CallStartTimerState(duration.inSeconds));
  }

 int startTimer( int seconds) {
   emit(CallStartState());
   const duration = const Duration(seconds: 1);
   timer = Timer.periodic(
       duration ,(_)=>addTime()
  );
   print(timer);
   print(seconds);

   emit(CallStartTimerState(duration.inSeconds));
  return seconds;

 }

 String timeToString(int seconds) {
   String twoDigits(int n) {
     if (n >= 10) return "$n";
     return "0$n";
   }
   String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
   String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
   return "$twoDigitMinutes:$twoDigitSeconds";
 }



 void stopTimer() {
  timer.cancel();
  emit(CallEndTimerState());
 }


}



