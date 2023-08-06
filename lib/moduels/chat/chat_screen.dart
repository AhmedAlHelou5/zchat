import 'dart:io';

import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:zchat/layout/profile/profile_layout.dart';
import 'package:zchat/models/user/user_model.dart';
import 'package:zchat/moduels/chat/cubit/cubit.dart';
import 'package:zchat/moduels/chat/cubit/states.dart';
import 'package:zchat/shared/components/components.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class ChatScreen extends StatelessWidget {
  final UserModel? model;


  ChatScreen({required this.model});


  // ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: BlocConsumer<ChatCubit, ChatStates>(
        listener: (context, state) {
          // TODO: implement listener
          if (state is ChatChangeLengthState)
            NoMessage(context);
          if (state is ChatChangeIconToSendState)
            ChangeToSend(context);
          if (state is ChatTapEmojiIconState)
            OffstageEmoji(context, ChatCubit
                .get(context)
                .emojiShowing);
        },
        builder: (context, state) {
          var cubit = ChatCubit.get(context);
          return SafeArea(
            child: Scaffold(
              appBar:  AppBar(
                leadingWidth: MediaQuery
                    .of(context)
                    .size
                    .width * 0.12,
                leading: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      size: 16,
                      color: defaultColor,
                    )),
                actions: [
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      ),
                    ),
                    itemBuilder: (BuildContext context) {
                      return cubit.menu;
                    },
                    icon:SvgPicture.asset(
                      'assets/icons/menu-call.svg',
                      color: defaultColor,
                      height: 19,
                      width: 19,
                    ) ,
                    padding: EdgeInsets.all(8),

                    color: defaultColor,

                  ),
                ],
                backgroundColor: Colors.white,
                titleSpacing: 0,
                title: InkWell(
                  onTap: () {
                    navigateTo(context, ProfileLayout(model:model ));
                  },
                  child: Row(children: [
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width * 0.12,
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                            image: AssetImage('${model!.image}'),
                            fit: BoxFit.cover,
                          )
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${model!.name}',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 17,
                              letterSpacing: 1,
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(height: 3,),
                        Text(
                          '${model!.isOnline == true?'Online':'Offline'}',
                          style: Theme
                              .of(context)
                              .textTheme
                              .caption!
                              .copyWith(
                            fontSize: 15,
                            color:model!.isOnline == true? defaultColor:Colors.grey,
                            fontFamily: 'Gilroy',
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ),
              body: SingleChildScrollView(
                // physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.9,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[

                         Expanded(
                           child: ListView.separated(
                              itemBuilder: (context, index) => buildMessage('hello'),
                              separatorBuilder: (context, index) => buildMyMessage('welcome'
                              ),
                              itemCount: 10),
                         ),

                  buildSendItem(context),

                  if (cubit.emojiShowing ==true)
                  Offstage(
                    offstage: !cubit.emojiShowing!,
                    child: SizedBox(
                        height: 280,
                        child: EmojiPicker(
                          onEmojiSelected: (category, emoji) {
                            if (emoji.emoji.isNotEmpty) {
                                cubit.controller.text += emoji.emoji;
                                cubit.changeToSend();

                            } else if (emoji != null) {
                              cubit.controller.text = emoji.emoji;
                              cubit.changeToSend();

                            }
                          },
                          textEditingController:  cubit.controller,
                          config: Config(
                            columns: 9,
                            // Issue: https://github.com/flutter/flutter/issues/28894
                            emojiSizeMax: 32 * (Platform.isIOS ? 1.40 : 1.0),
                            verticalSpacing: 0,
                            horizontalSpacing: 0,
                            gridPadding: EdgeInsets.zero,
                            bgColor: const Color(0xFFF2F2F2),
                            indicatorColor: Colors.blue,
                            iconColor: Colors.grey,
                            iconColorSelected: Colors.blue,
                            skinToneDialogBgColor: Colors.white,
                            skinToneIndicatorColor: Colors.grey,
                            buttonMode: ButtonMode.MATERIAL,
                          ),
                        )),
                  )



                    ],
                  ),
                ),
              ),
              
            ),

          );
        },
      ),
    );
  }


  Widget buildSendItem(context) =>
      Container(
        color: Colors.white,
        padding:
        EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        height: MediaQuery
            .of(context)
            .size
            .height * 0.12,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child:


        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: MediaQuery
                    .of(context)
                    .size
                    .width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[200],
                ),
                padding: EdgeInsets.symmetric(
                    horizontal: 40, vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextFormField(
                          autocorrect: true,
                          controller: ChatCubit
                              .get(context)
                              .controller,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText:
                            'Type Your message...',
                            hintStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontFamily: 'Gilroy',
                                letterSpacing: 1),
                          ),
                          onChanged: (val) {
                            ChatCubit.get(context).changeLength(val.length);
                          }),
                    ),
                    ChatCubit
                        .get(context)
                        .state is ChatChangeIconToSendState
                        ? ChangeToSend(context)
                        : NoMessage(context),
                  ],
                ),
              ),
            ),
          ],
        ),


      );

  Widget ChangeToSend(context) =>
      Expanded(
        flex: 1,
        child: IconButton(
            color: defaultColor,
            onPressed: () {
              print('Send');

            },
            icon: Icon(
              Icons.send,
            )),
      );

  Widget OffstageEmoji(context, emoji) =>
      Expanded(
        child: Offstage(

          offstage: !ChatCubit.get(context).emojiShowing!,
          child: SizedBox(
              height: 280,
              child: EmojiPicker(
                onEmojiSelected: (category, emoji) {
                  if (emoji.emoji.isNotEmpty) {
                    ChatCubit
                        .get(context)
                        .controller
                        .text +=

                        emoji.emoji;
                    ChatCubit.get(context).changeToSend();
                  } else {
                    ChatCubit
                        .get(context)
                        .controller
                        .text = emoji.emoji;
                  }
                },
                textEditingController: ChatCubit
                    .get(context)
                    .controller,
                config: Config(
                  columns: 9,
                  // Issue: https://github.com/flutter/flutter/issues/28894
                  emojiSizeMax:
                  32 * (Platform.isIOS ? 1.40 : 1.0),
                  verticalSpacing: 0,
                  horizontalSpacing: 0,
                  backspaceColor: defaultColor,
                  gridPadding: EdgeInsets.zero,
                  bgColor: const Color(0xFFF2F2F2),
                  indicatorColor: Colors.blue,
                  iconColor: Colors.grey,
                  iconColorSelected: Colors.blue,
                  skinToneDialogBgColor: Colors.white,
                  skinToneIndicatorColor: Colors.grey,
                  buttonMode: ButtonMode.MATERIAL,
                ),
              )),
        ),
      );

  Widget NoMessage(context) =>
      Expanded(
        flex: 2,
        child: Row(
          children: [
            Expanded(
              child: IconButton(
                color: defaultColor,
                onPressed: () {
                  ChatCubit.get(context).showBottomSheet(context);
                },
                icon: const Icon(
                  Icons.add,
                  size: 23,
                ),
              ),
            ),
            Expanded(
              child: IconButton(
                  icon: Icon(Icons.camera_alt_rounded,
                      size: 23, color: defaultColor),
                  onPressed: () {}),
            ),
            Expanded(
              child: IconButton(
                  icon:
                  Icon(Icons.emoji_emotions, size: 23, color: defaultColor),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    ChatCubit.get(context).changeEmojiShowing();
                    // callBack;
                  }),
            )
          ],
        ),
      );

  // AppBar appBarWidget(model,context) =>
  //     AppBar(
  //       leadingWidth: MediaQuery
  //           .of(context)
  //           .size
  //           .width * 0.12,
  //       leading: IconButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           icon: Icon(
  //             Icons.arrow_back_ios,
  //             size: 16,
  //             color: defaultColor,
  //           )),
  //       actions: [
  //
  //         PopupMenuButton(
  //           shape: RoundedRectangleBorder(
  //             borderRadius: BorderRadius.only(
  //               topLeft: Radius.circular(40),
  //               topRight: Radius.circular(10),
  //               bottomLeft: Radius.circular(40),
  //               bottomRight: Radius.circular(40),
  //             ),
  //           ),
  //           itemBuilder: (BuildContext context) {
  //                 return [
  //                 PopupMenuItem(
  //                 child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/call-svgrepo-com.svg',
  //                     allowDrawingOutsideViewBox: true,height: 24,width: 24,
  //                 color: Colors.white),title: 'Calls',
  //                     color: Colors.white,weight: FontWeight.w600,fontSize:18),
  //                 ),
  //
  //                   PopupMenuItem(
  //                     child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/Delete.svg',
  //                         allowDrawingOutsideViewBox: true,height: 24,width: 24,
  //                         color: Colors.white),title: 'Delete chat history',
  //                         color: Colors.white,weight: FontWeight.w600,fontSize:16 ),
  //                   ),
  //                   PopupMenuItem(
  //                     child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/notification1.svg',
  //                         allowDrawingOutsideViewBox: true,height: 24,width: 24,
  //                         color: Colors.white),title: 'Mute notification',
  //                         color: Colors.white,weight: FontWeight.w600,fontSize:18),
  //                   ),
  //                   PopupMenuItem(
  //                     child:  buildItemDrawer(icon:SvgPicture.asset('assets/icons/Search.svg',
  //                         allowDrawingOutsideViewBox: true,height: 24,width: 24,
  //                         color: Colors.white),title: 'Search',
  //                         color: Colors.white,weight: FontWeight.w600,fontSize:18),
  //                   ),
  //
  //
  //
  //
  //
  //                 ];
  //                     },
  //           icon:SvgPicture.asset(
  //             'assets/icons/menu-call.svg',
  //             color: defaultColor,
  //             height: 19,
  //             width: 19,
  //           ) ,
  //
  // color: defaultColor,
  //
  // ),
  //       ],
  //       backgroundColor: Colors.white,
  //       titleSpacing: 0,
  //       title: InkWell(
  //         onTap: () {
  //           navigateTo(context, ProfileLayout());
  //         },
  //         child: Row(children: [
  //           Container(
  //             width: MediaQuery
  //                 .of(context)
  //                 .size
  //                 .width * 0.1,
  //             height: MediaQuery
  //                 .of(context)
  //                 .size
  //                 .height * 0.1,
  //             decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(15),
  //                 image: DecorationImage(
  //                   image: AssetImage('${ChatCubit.get(context).model!.image}'),
  //                   // fit: BoxFit.cover,
  //                 )
  //             ),
  //           ),
  //           SizedBox(
  //             width: 15,
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 '${ChatCubit.get(context).model!.name}',
  //                 style: TextStyle(
  //                     color: Colors.black,
  //                     fontSize: 17,
  //                     fontFamily: 'Gilroy',
  //                     fontWeight: FontWeight.w700),
  //               ),
  //               Text(
  //                 '${ChatCubit.get(context).model!.isOnline}',
  //                 style: Theme
  //                     .of(context)
  //                     .textTheme
  //                     .caption!
  //                     .copyWith(
  //                   fontSize: 15,
  //                   color:ChatCubit.get(context).model!.isOnline == true? defaultColor:Colors.grey,
  //                   fontFamily: 'Gilroy',
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ]),
  //       ),
  //     );

  Widget buildMessage(message) =>
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Align(
          alignment: AlignmentDirectional.centerStart,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: const BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(35),
                topEnd: Radius.circular(35),
                bottomEnd: Radius.circular(35),
                bottomStart: Radius.circular(10),
              ),
            ),
            child: Text(
              '$message',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
        ),
      );

  Widget buildMyMessage(message) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: BoxDecoration(
              color: HexColor('#F2F2F2'),
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(35),
                bottomStart: Radius.circular(35),
                topEnd: Radius.circular(10),
                bottomEnd: Radius.circular(35),
              ),
            ),
            child: Text(
              '$message',
              style: TextStyle(fontSize: 18, color: Colors.black),
            ),
          ),
        ),
      );

  Widget buildImageMessage(context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.65,
          height: MediaQuery
              .of(context)
              .size
              .height * 0.2,

          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
                bottomRight: Radius.circular(35),
                bottomLeft: Radius.circular(10),
              ),

              image: DecorationImage(
                image: AssetImage(
                  'assets/images/silver-metallic-color-sport-sedan-road.jpg',),
                fit: BoxFit.cover,
              )

          ),

        ),
      );

  Widget buildMyImageMessage(context) =>
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Align(
          alignment: AlignmentDirectional.centerEnd,
          child: Container(
            width: MediaQuery
                .of(context)
                .size
                .width * 0.65,
            height: MediaQuery
                .of(context)
                .size
                .height * 0.2,
            padding: const EdgeInsets.symmetric(
                horizontal: 20, vertical: 10),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(35),
                  bottomLeft: Radius.circular(35),
                ),

                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/silver-metallic-color-sport-sedan-road.jpg',),
                  fit: BoxFit.cover,
                )

            ),

          ),
        ),
      );

}
