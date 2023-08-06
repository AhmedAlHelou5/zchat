
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:zchat/models/call/call_model.dart';
import 'package:zchat/moduels/call_history/cubit/states.dart';

class CallHistoryCubit extends Cubit<CallHistoryStates> {
  CallHistoryCubit() : super(CallHistoryInitialState());

  static CallHistoryCubit get(context) => BlocProvider.of(context);

  CallModel? model;


  List<CallModel> Calllist = [
    CallModel(
      id: '1',
      name: 'Ahmed',
      image: 'assets/images/image3.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: true,),
    CallModel(
      id: '2',
      name: 'Ali',
      image: 'assets/images/image1.jpeg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: false,),
    CallModel(
      id: '3',
      name: 'Adam',
      image: 'assets/images/image2.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: true,),
    CallModel(
      id: '4',
      name: 'Bill',
      image: 'assets/images/bill-gates-wealthiest-person.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: false,),
    CallModel(
      id: '5',
      name: 'Mahmoud',
      image: 'assets/images/image3.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: true,),
    CallModel(
      id: '6',
      name: 'Mohammed',
      image: 'assets/images/image1.jpeg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: false,),
    CallModel(
      id: '7',
      name: 'Alex',
      image: 'assets/images/image2.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: true,),
    CallModel(
      id: '8',
      name: 'Bill',
      image: 'assets/images/bill-gates-wealthiest-person.jpg',
      phone: '970592722152',
      lastCallTime:  '${DateFormat.jm().format(DateTime.now())}',
      isReceived: false,),
    CallModel(
      id: '9',
      name: 'Adam',
      image: 'assets/images/image2.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: true,),
    CallModel(
      id: '10',
      name: 'Bill',
      image: 'assets/images/bill-gates-wealthiest-person.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: false,),
    CallModel(
      id: '11',
      name: 'Mahmoud',
      image: 'assets/images/image3.jpg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: true,),
    CallModel(
      id: '12',
      name: 'Mohammed',
      image: 'assets/images/image1.jpeg',
      phone: '970592722152',
      lastCallTime: '${DateFormat.jm().format(DateTime.now())}',
      isReceived: false,),
  ] ;
  List listCallHistory=[];

  void getCallHistoryData() {
    emit(CallHistoryLoadingState());
    listCallHistory=[];
    Calllist.forEach((element) {
      listCallHistory.add(element);
      emit(CallHistorySuccessState());
    });
    emit(CallHistorySuccessState());
  }





}