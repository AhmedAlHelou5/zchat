import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:zchat/layout/home/cubit/states.dart';
import 'package:zchat/models/user/user_model.dart';
import 'package:zchat/moduels/all_chat/all_chat_screen.dart';
import 'package:zchat/moduels/improtant_chat/important_chat_screen.dart';
import 'package:zchat/moduels/read_chat/read_chat_screen.dart';
import 'package:zchat/moduels/unread_chat/unread_chat_screen.dart';
import 'package:zchat/shared/components/components.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);
  var timeNow = DateTime.now();

  var firstNameController = TextEditingController();
  var lastNameController = TextEditingController();
  var phoneController = TextEditingController();

  //
  UserModel? model;

  // List<UserModel> Userlist = [];
  List<UserModel> Userlist = [
    UserModel(
      id: '1',
      name: 'Ahmed',
      username: 'user1',
      image: 'assets/images/image3.jpg',
      lastMessage: 'Hi',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 10,
      isOnline: true,
    ),
    UserModel(
      id: '2',
      name: 'Ali',
      username: 'user2',
      image: 'assets/images/image1.jpeg',
      lastMessage: 'Hello',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 18,
      isOnline: false,
    ),
    UserModel(
      id: '3',
      name: 'Adam',
      username: 'user3',
      image: 'assets/images/image2.jpg',
      lastMessage: 'Welcome',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 3,
      isOnline: true,
    ),
    UserModel(
      id: '4',
      name: 'Bill',
      username: 'user4',
      image: 'assets/images/bill-gates-wealthiest-person.jpg',
      lastMessage: 'I am here',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 6,
      isOnline: false,
    ),
    UserModel(
      id: '5',
      name: 'Mahmoud',
      username: 'user5',
      image: 'assets/images/image3.jpg',
      lastMessage: 'Hi',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 10,
      isOnline: true,
    ),
    UserModel(
      id: '6',
      name: 'Mohammed',
      username: 'user6',
      image: 'assets/images/image1.jpeg',
      lastMessage: 'Hello',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 18,
      isOnline: false,
    ),
    UserModel(
      id: '7',
      name: 'Alex',
      username: 'user7',
      image: 'assets/images/image2.jpg',
      lastMessage: 'Welcome',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 3,
      isOnline: true,
    ),
    UserModel(
      id: '8',
      name: 'Bill',
      username: 'user8',
      image: 'assets/images/bill-gates-wealthiest-person.jpg',
      lastMessage: 'I am here',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 6,
      isOnline: false,
    ),
    UserModel(
      id: '9',
      name: 'Adam',
      username: 'user9',
      image: 'assets/images/image2.jpg',
      lastMessage: 'Welcome',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 3,
      isOnline: true,
    ),
    UserModel(
      id: '10',
      name: 'Bill',
      username: 'user10',
      image: 'assets/images/bill-gates-wealthiest-person.jpg',
      lastMessage: 'I am here',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 6,
      isOnline: false,
    ),
    UserModel(
      id: '11',
      name: 'Mahmoud',
      username: 'user11',
      image: 'assets/images/image3.jpg',
      lastMessage: 'Hi',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 10,
      isOnline: true,
    ),
    UserModel(
      id: '12',
      name: 'Mohammed',
      username: 'user12',
      image: 'assets/images/image1.jpeg',
      lastMessage: 'Hello',
      phone: '970592722152',
      lastMessageTime: '${DateFormat.jm().format(DateTime.now())}',
      unreadMessage: 18,
      isOnline: false,
    ),
  ];

  List listUser = [];

  void getUserData() {
    emit(HomeGetUserLoadingState());
    listUser = [];
    Userlist.forEach((element) {
      listUser.add(element);
      emit(HomeGetUserSuccessState());
    });
    emit(HomeGetUserSuccessState());
  }

  void showBottomSheet(context,firstNameController,lastNameController,phoneController) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        isScrollControlled: true,
        builder: (builder) {
          return SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
            margin: EdgeInsets.symmetric(
            horizontal: 5,),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )),
              // margin: const EdgeInsets.all(18.0),
              // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'New Contact',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 30),
                    defaultFormField(controller:firstNameController , type: TextInputType.name, validate: (String? value){
                      if(value!.isEmpty){
                        return 'Please enter name';
                      }

                      return null;

                    }, label: 'First Name', prefix: Icons.person),
                    SizedBox(height: 20),
                    defaultFormField(controller:lastNameController , type: TextInputType.name, validate: (String? value){
                      if(value!.isEmpty){
                        return 'Please enter name';
                      }

                      return null;

                    }, label: 'Last Name', prefix: Icons.person),
                    SizedBox(height: 20),
                    IntlPhoneField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        border: OutlineInputBorder(
                          borderSide: BorderSide(),
                        ),
                      ),
                      initialCountryCode: 'IN',
                      onChanged: (phone) {
                        print(phone.completeNumber);
                      },
                    ) ,
                    SizedBox(height: 30),
                    defaultButton(radius: 20,wid: MediaQuery.of(context).size.width*0.5,function: (){
                      Navigator.pop(context);
                    }, text: 'Create Contact')
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     InkWell(
                    //       onTap: () {
                    //         print('Image');
                    //       },
                    //       child: Column(
                    //         children: [
                    //           SvgPicture.asset('assets/icons/image.svg',
                    //               height: 29, width: 29, color: defaultColor),
                    //           SizedBox(
                    //             height: 15,
                    //           ),
                    //           Text(
                    //             'Image',
                    //             style: TextStyle(
                    //                 fontSize: 13,
                    //                 color: defaultColor,
                    //                 fontFamily: 'Gilroy'
                    //                 // fontWeight: FontWeight.w100,
                    //                 ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 40,
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         print('Document');
                    //       },
                    //       child: Column(
                    //         children: [
                    //           SvgPicture.asset(
                    //             'assets/icons/document.svg',
                    //             height: 29,
                    //             width: 29,
                    //             color: defaultColor,
                    //           ),
                    //           SizedBox(
                    //             height: 15,
                    //           ),
                    //           Text(
                    //             'Document',
                    //             style: TextStyle(
                    //                 fontSize: 13,
                    //                 color: defaultColor,
                    //                 fontFamily: 'Gilroy'
                    //                 // fontWeight: FontWeight.w100,
                    //                 ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 40,
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         print('Contacts');
                    //       },
                    //       child: const Column(
                    //         children: [
                    //           Icon(
                    //             Icons.person_outline_rounded,
                    //             color: defaultColor,
                    //             size: 30,
                    //           ),
                    //           SizedBox(
                    //             height: 15,
                    //           ),
                    //           Text(
                    //             'Contacts',
                    //             style: TextStyle(
                    //                 fontSize: 13,
                    //                 color: defaultColor,
                    //                 fontFamily: 'Gilroy'
                    //                 // fontWeight: FontWeight.w100,
                    //                 ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //     const SizedBox(
                    //       width: 40,
                    //     ),
                    //     InkWell(
                    //       onTap: () {
                    //         print('Location');
                    //       },
                    //       child: const Column(
                    //         children: [
                    //           Icon(
                    //             Icons.location_on_outlined,
                    //             // semanticLabel: "Help",
                    //             size: 29,
                    //             color: defaultColor,
                    //           ),
                    //           SizedBox(
                    //             height: 15,
                    //           ),
                    //           Text(
                    //             'Location',
                    //             style: TextStyle(
                    //                 fontSize: 13,
                    //                 color: defaultColor,
                    //                 fontFamily: 'Gilroy'
                    //
                    //                 // fontWeight: FontWeight.w100,
                    //                 ),
                    //           )
                    //         ],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
            ),
            ),
          );
        });
    emit(HomeShowBottomSheetState());
  }

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
  List<dynamic> list = [];

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
  List<dynamic> search = [];

  void getSearch(String value) {
    emit(HomeGetSearchUserLoadingState());
    search = [];

    Userlist.forEach((element) {
      search.add(element);
      emit(HomeGetSearchUserSuccessState());
    });
    // DioHelper.getData(url: 'v2/top-headlines', query: {
    //   'q':'$value',
    //   'apiKey':'7cb6188f56054dd1a027ae47ecc4b5cc'
    // }).then((value) {
    //   emit(HomeGetSearchUserSuccessState());
    // }).catchError((error){
    //   print(error.toString());
    //   emit(HomeGetSearchUserErrorState(error.toString()));
    // });
  }

  void changeTabBar(int index) {
    currentIndex = index;
    emit(HomeChangeTabBarState());
  }
}
