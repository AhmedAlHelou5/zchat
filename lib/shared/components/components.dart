import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import 'package:zchat/moduels/call_history/call_history_screen.dart';
import 'package:zchat/moduels/settings/setting_screen.dart';
import 'package:zchat/shared/styles/colors/colors.dart';


Widget buildAllChatItem(context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Stack(
          alignment: Alignment.bottomRight,
          children:[
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 82,
              height: 72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle2.png'),
                    // fit: BoxFit.cover,
                  )),
            ),

            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: defaultColor,
              ),
            )


          ]
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text(
            'Robert Fox',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'why did you do that?',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 15, color: defaultColor),
          ),
        ],
      ),

      Spacer(),

      Column(
        children: [
          Text('15:20',style: Theme.of(context).textTheme.caption!,),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: HexColor('2695EC'),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('2',
                style: TextStyle(color: Colors.white)),
          ),

          // SvgPicture.asset('assets/icons/mark_read.svg',height: 19,width: 19,)


        ],
      ),

      SizedBox(width: 10,)

    ],
  ),
);
Widget buildImportantChatItem(context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Stack(
        alignment: Alignment.bottomRight,
        children:[
          Container(
          margin: EdgeInsets.only(left: 10),
          width: 82,
          height: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/Rectangle2.png'),
                // fit: BoxFit.cover,
              )),
        ),

          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 8,
            child: CircleAvatar(
              radius: 4,
              backgroundColor: defaultColor,
            ),
          )


        ]
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Robert Fox',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'why did you do that?',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 15, color: defaultColor),
          ),
        ],
      ),

      Spacer(),

      Column(
        children: [
          Text('15:20',style: Theme.of(context).textTheme.caption!,),
          SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: HexColor('2695EC'),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text('2',
                style: TextStyle(color: Colors.white)),
          ),

          // SvgPicture.asset('assets/icons/mark_read.svg',height: 19,width: 19,)


        ],
      ),

      SizedBox(width: 10,)

    ],
  ),
);
Widget buildUnreadChatItem(context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Stack(
          alignment: Alignment.bottomRight,
          children:[
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 82,
              height: 72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle2.png'),
                    // fit: BoxFit.cover,
                  )),
            ),

            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: defaultColor,
              ),
            )


          ]
      ),      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Robert Fox',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'why did you do that?',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 15, color: defaultColor),
          ),
        ],
      ),

      Spacer(),

      Column(
        children: [
          Text('15:20',style: Theme.of(context).textTheme.caption!,),
          SizedBox(
            height: 5,
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //       horizontal: 8, vertical: 4),
          //   decoration: BoxDecoration(
          //     color: HexColor('2695EC'),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: const Text('2',
          //       style: TextStyle(color: Colors.white)),
          // ),

          SvgPicture.asset('assets/icons/mark_read.svg',height: 19,width: 19,color: Colors.grey,)


        ],
      ),

      SizedBox(width: 10,)

    ],
  ),
);
Widget buildReadChatItem(context)=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Stack(
          alignment: Alignment.bottomRight,
          children:[
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 82,
              height: 72,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage('assets/images/Rectangle2.png'),
                    // fit: BoxFit.cover,
                  )),
            ),

            CircleAvatar(
              backgroundColor: Colors.white,
              radius: 8,
              child: CircleAvatar(
                radius: 4,
                backgroundColor: defaultColor,
              ),
            )


          ]
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Robert Fox',
            style: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Text(
            'why did you do that?',
            style: Theme.of(context)
                .textTheme
                .caption!
                .copyWith(fontSize: 15, color: defaultColor),
          ),
        ],
      ),

      Spacer(),

      Column(
        children: [
          Text('15:20',style: Theme.of(context).textTheme.caption!,),
          SizedBox(
            height: 5,
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(
          //       horizontal: 8, vertical: 4),
          //   decoration: BoxDecoration(
          //     color: HexColor('2695EC'),
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: const Text('2',
          //       style: TextStyle(color: Colors.white)),
          // ),

          SvgPicture.asset('assets/icons/mark_read.svg',height: 19,width: 19,)


        ],
      ),

      SizedBox(width: 10,)

    ],
  ),
);
Widget buildCallHistoryItem(context)=> Padding(
  padding: const EdgeInsets.all(8.0),
  child: Row(
    children: [
      Stack(alignment: Alignment.bottomRight, children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 72,
          height: 72,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage('assets/images/Rectangle2.png'),
                // fit: BoxFit.cover,
              )),
        ),

      ]),
      SizedBox(
        width: 15,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Robert Fox',
            style: TextStyle(
                fontSize: 23,
                color: Colors.black,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 7,
          ),
          Row(
            children: [

              // Icon(Icons.call_made_outlined, color: defaultColor,size: 18),

              SvgPicture.asset('assets/icons/call-down.svg',height: 24,width: 24,),

              Text(
                '18.20.2022 at 19:30',
                style: Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 15,
                  fontFamily: 'Gilroy',
                ),
              ),
            ],
          ),
        ],
      ), Spacer(),

    ],
  ),
);
Widget buildBottomSheetAttachFile(context)=>Container(
  height: MediaQuery.of(context).size.height * 0.13,
  width: MediaQuery.of(context).size.width,
  child: Container(
    color: Colors.white,
    // margin: const EdgeInsets.all(18.0),
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              InkWell(
                onTap: ()  {
                  print('Image');
                },
                child: Column(
                  children:  [
                   SvgPicture.asset('assets/icons/image.svg',height: 29,width: 29,color: defaultColor),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Image',
                      style: TextStyle(
                        fontSize: 13,
                        color: defaultColor,
                        fontFamily: 'Gilroy'
                        // fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
              ),

              const   SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: ()  {
                  print('Document');

                },
                child: Column(
                  children:  [
               SvgPicture.asset('assets/icons/document.svg',height: 29,width: 29,color: defaultColor,),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Document',
                      style: TextStyle(
                        fontSize: 13,
                        color: defaultColor,
                        fontFamily: 'Gilroy'
                        // fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
              ),

              const   SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: ()  {
                  print('Contacts');

                  },
                child:const Column(
                  children:  [
                      Icon(Icons.person_outline_rounded,color: defaultColor,size: 30,),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Contacts',
                      style: TextStyle(
                        fontSize: 13,
                        color: defaultColor,
                        fontFamily: 'Gilroy'
                        // fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
              ),
              const   SizedBox(
                width: 40,
              ),
              InkWell(
                onTap: ()  {
                  print('Location');

                },
                child:const Column(
                  children:  [
                    Icon(
                      Icons.location_on_outlined,
                      // semanticLabel: "Help",
                      size: 29,
                      color: defaultColor,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Location',
                      style: TextStyle(
                        fontSize: 13,
                        color: defaultColor,
                        fontFamily: 'Gilroy'

                        // fontWeight: FontWeight.w100,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  ),
);

Widget buildSlideChatItem(context,widget,)=>Slidable(
  // Specify a key if the Slidable is dismissible.
  key: const ValueKey(0),

  // The start action pane is the one at the left or the top side.

  // The end action pane is the one at the right or the bottom side.
  endActionPane: const ActionPane(
    motion: ScrollMotion(),
    children: [
      SlidableAction(
        // An action can be bigger than the others.
        foregroundColor: defaultColor,
        icon:Icons.bookmark_outline,
      ),
      SlidableAction(
        foregroundColor: defaultColor,
        icon: Icons.check,
      ),
      SlidableAction(
        // backgroundColor: Color(0xFFFE4A49),
        foregroundColor: defaultColor,
        icon:Icons.delete,
      ),
    ],
  ),

  // The child of the Slidable is what the user sees when the
  // component is not dragged.
  child: widget,
);
Widget buildItemDrawer(
    {required Widget? icon,Function()? onTap,required String? title, Color? color, FontWeight? weight,double? fontSize})=>ListTile(
  leading: icon,
  onTap:onTap ,
  title: Text('$title',style: TextStyle(color: color,fontWeight: weight,fontSize:fontSize ,fontFamily: 'Gilroy',letterSpacing: 1),),
);
List<String> DarwerString = [
  'Contacts',
  'Calls',
  'Save Messages',
  'Invite Friends',
  'Telegram FAQ',
];


// Widget buildGirdViewImageProfileLayout(context)=>  GridView.count(
//     crossAxisCount: 3,
//     // shrinkWrap: true,
//     children: List.generate(20, (i) => GridAnimatorWidget(
//       child: Padding(
//         padding: const EdgeInsets.all(4),
//         child: ClipRRect(
//           borderRadius: const BorderRadius.all(Radius.circular(10)),
//           child: Container(
//             color: Colors.grey,
//             child: Image.network(
//               'https://picsum.photos/200/300',
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//       ),
//     ),).toList()
// );
// Widget buildListViewDocumentProfileLayout(context)=>   AnimatedListView(
//     duration: 100,
//     extendedSpaceBetween: 30,
//     spaceBetween:10,
//     children: List.generate(
//         21,
//             (index) => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Stack(
//                   alignment: Alignment.bottomRight,
//                   children:[
//                     Container(
//                       width: 50,
//                       height: 50,
//                       child: SvgPicture.asset(
//                         'assets/icons/document-text-svgrepo-com.svg',
//                         height: 20,
//                         width: 20,
//                         fit: BoxFit.contain,
//
//
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         // color: Colors.grey[200],
//
//                         // image: DecorationImage(
//                         //   image:
//                         //   // fit: BoxFit.cover,
//                         // )
//                       ),
//                     ),
//
//
//                   ]
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     'Document ',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 7,
//                   ),
//                   Text(
//                     '13.2 MB , 04.08.23 at 10:30 PM',
//                     style: Theme.of(context)
//                         .textTheme
//                         .caption!
//                         .copyWith(fontSize: 13, color: Colors.grey),
//                   ),
//                 ],
//               ),
//
//
//
//             ],
//           ),
//         )
//     )) ;
// Widget buildListViewLocationProfileLayout(context)=>   AnimatedListView(
//     duration: 100,
//     extendedSpaceBetween: 30,
//     spaceBetween:20,
//     children: List.generate(
//         21,
//             (index) => Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             children: [
//               Stack(
//                   alignment: Alignment.bottomRight,
//                   children:[
//                     Container(
//                       width: 40,
//                       height: 40,
//                       child: SvgPicture.asset(
//                         'assets/icons/location-pin-svgrepo-com.svg',
//
//                         fit: BoxFit.contain,
//                         color: defaultColor,
//
//
//                       ),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         // color: Colors.grey[200],
//
//                         // image: DecorationImage(
//                         //   image:
//                         //   // fit: BoxFit.cover,
//                         // )
//                       ),
//                     ),
//
//
//                   ]
//               ),
//               SizedBox(
//                 width: 15,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//
//                   Text(
//                     'Location ',
//                     style: TextStyle(
//                         fontSize: 15,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold),
//                   ),
//                   SizedBox(
//                     height: 7,
//                   ),
//                   Text(
//                     'USA',
//                     style: Theme.of(context)
//                         .textTheme
//                         .caption!
//                         .copyWith(fontSize: 13, color: Colors.grey),
//                   ),
//                 ],
//               ),
//
//
//
//             ],
//           ),
//         )
//     )) ;
//



Widget buildHomeDrawer(context)=>Drawer(
  width: MediaQuery.of(context).size.width * 0.78,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(40),
      bottomLeft: Radius.circular(40),
    ),
  ),

  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 10,
        ),

        ListTile(
          leading: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: defaultColor,
            size: 15,
          ),
          trailing: SvgPicture.asset(
            'assets/icons/Setting.svg',
            color: defaultColor,
            height: 18,
            width: 18,
          ),
          onTap: () {
                navigateTo(context, SettingsScreen());
            },
        ),
        const  SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {
            navigateTo(context, SettingsScreen());
          },
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/Rectangle24.png'),
                      // fit: BoxFit.cover,
                    )),
              ),
              const  SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.3,
                    child:const Text(
                      'Cameron Williamson ',
                      style: TextStyle(
                          fontSize: 19,
                          color: defaultColor,
                          height: 1.3,
                          overflow: TextOverflow.ellipsis,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                    ),
                  ),

                ],
              ),

            ],
          ),
        ),

        const  SizedBox(
          height: 50,
        ),

        // DrawerList()

        buildItemDrawer(icon: Icon(Icons.person_outline_rounded,color: defaultColor),title: 'Contact',color: defaultColor,weight: FontWeight.w600),
        SizedBox(height: 5,),
        buildItemDrawer(icon:SvgPicture.asset('assets/icons/call-svgrepo-com.svg',  allowDrawingOutsideViewBox: true,height: 24,width: 24,
            color: defaultColor),onTap: (){
          navigateTo(context, CallHistoryScreen());
        },title: 'Calls',color: defaultColor,weight: FontWeight.w600),
        SizedBox(height: 5,),

        buildItemDrawer(icon:Icon(Icons.bookmark_outline,color: defaultColor),title: 'Save Messages',color: defaultColor,weight: FontWeight.w600),
        SizedBox(height: 5,),
        buildItemDrawer(icon:Icon(Icons.person_add_alt_outlined,color: defaultColor),title: 'Invite Friends',color: defaultColor,weight: FontWeight.w600),
        SizedBox(height: 5,),
        buildItemDrawer(icon:SvgPicture.asset('assets/icons/faq.svg',  allowDrawingOutsideViewBox: true,height: 24,width: 24,
            color: defaultColor),title: 'Telegram FAQ',color: defaultColor,weight: FontWeight.w600),

        // buildItemDrawer(Icons.person_outline_rounded, 'Contact'),
        // buildItemDrawer(Icons.person_outline_rounded, 'Contact'),
        // buildItemDrawer(Icons.person_outline_rounded, 'Contact'),
        // buildItemDrawer(Icons.person_outline_rounded, 'Contact'),
        // buildItemDrawer(Icons.person_outline_rounded, 'Contact'),


      ],


    ),
  ),
);


Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);
void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);
void navigateAndFinish(context,Widget widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
    (route) => false
);


Widget defaultFormField({

  required  TextEditingController? controller,
  required TextInputType? type,
  required  validate,
  required String? label,
  required IconData? prefix,
  IconData? suffix,
  VoidCallback? suffixPresed,
  onSubmit,
  onTap,
  onChange,
  bool?  isPassword=false,
  bool?  isClickable=true,
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword!,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  validator: validate,
  enabled: isClickable,
  onTap: onTap,
  decoration:  InputDecoration(
    labelText: label,
    suffixIcon: suffix != null ? IconButton(icon: Icon(suffix), onPressed: suffixPresed,):null,

    prefixIcon: Icon(
      prefix,
    ),
    focusColor: Colors.blue,

    border: OutlineInputBorder(),
  ),
);


Widget defaultButton ({
  double wid = double.infinity,
  double height = 45,
  double radius = 0.0,
  Color background=Colors.blue,
  bool isUpperCase=true,
  required VoidCallback? function,
  required String text,
})=> Container(
  width: wid,
  height: height,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: background,
  ),
  child: MaterialButton(
    onPressed: function,

    child:  Text(
      isUpperCase? text.toUpperCase():text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget defaultTextButton ({
  required VoidCallback? function,
  required String text,
  double wid = 100,

})=> TextButton(
  onPressed: function,
  child:  Text(
    text.toUpperCase(),


  ));

void showToast({
  required String text,
  required ToastStates state,
})=>Fluttertoast.showToast(
  msg: text,
  toastLength: Toast.LENGTH_LONG,
  gravity: ToastGravity.BOTTOM,
  timeInSecForIosWeb: 5,
  backgroundColor: chooseToastColor(state),
  textColor: Colors.white,
  fontSize: 16.0,
);

enum ToastStates{SUCCESS,ERROR,WARNING}
enum MenuItems{CALL,DELETE_CHAT_HISTORY,MUTE_NOTIFCATION,SEARCH}



Color chooseToastColor(ToastStates state){
  Color color;
  switch(state){
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;}


