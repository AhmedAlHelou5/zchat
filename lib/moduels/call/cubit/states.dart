abstract class CallStates {}
class CallInitialState extends CallStates {}
class CallLoadingState extends CallStates {}
class CallSuccessState extends CallStates {}
class CallStartState extends CallStates {}
class CallEndState extends CallStates {}
class CallRingingState extends CallStates {}
class CallStartTimerState extends CallStates {
  final int seconds;
  CallStartTimerState(this.seconds);
}
class CallEndTimerState extends CallStates {}







