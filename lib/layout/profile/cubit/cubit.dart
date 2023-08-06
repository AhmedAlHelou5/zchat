import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import 'package:zchat/layout/profile/cubit/states.dart';
import 'package:zchat/models/user/user_model.dart';
import 'package:zchat/moduels/profile/Image.dart';
import 'package:zchat/moduels/profile/document.dart';
import 'package:zchat/moduels/profile/location.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit() : super(ProfileInitialState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  // Widget buildGirdViewImageProfileLayout()=>  GridView.count(
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
  var PhoneNumber;
  String getFormattedPhoneNumber(PhoneNumber) {
    if (PhoneNumber.isEmpty) {
      return "";
    }

    String phoneNumber = PhoneNumber;
    bool addPlus = phoneNumber.startsWith("1");
    if (addPlus) phoneNumber = phoneNumber.substring(1);
    bool addParents = phoneNumber.length >= 3;
    bool addDash = phoneNumber.length >= 8;

    // +1
    String updatedNumber = "";
    if (addPlus) updatedNumber += "+1";

    // (222)
    if (addParents) {
      updatedNumber += "( ";
      updatedNumber += phoneNumber.substring(0, 3);
      updatedNumber += " ) ";
    } else {
      updatedNumber += phoneNumber.substring(0);
      return updatedNumber;
    }

    // 111
    if (addDash) {
      updatedNumber += phoneNumber.substring(3, 6);
      updatedNumber += " - ";
    } else {
      updatedNumber += phoneNumber.substring(3);
      return updatedNumber;
    }

    // 3333
    updatedNumber += phoneNumber.substring(6);
    return updatedNumber;
  }

  List<Widget>  widgets = [
    LocationProfileScreen(),
    ImageProfileScreen(),
    DocumentProfileScreen(),

    // AllChatScreen(),
    // ImportantChatScreen(),
    // UnreadChatScreen(),
    // ReadChatScreen(),
  ];

  List<String> taps = [
    'Location',
    'Image',
    'Documents',

  ];




  List<Tab> tapsList = const [
    Tab(
      text: 'Location',
    ),
    Tab(
      text: 'Image',

    ),
    Tab(
      text: 'Documents',
    ),


  ];

  void changeTabBarProfile(int index) {
    currentIndex = index;
    emit(ProfileChangeTabBarState());
  }

  }