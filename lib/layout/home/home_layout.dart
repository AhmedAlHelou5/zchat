import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:zchat/layout/home/cubit/cubit.dart';
import 'package:zchat/layout/home/cubit/states.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zchat/moduels/search/search_screen.dart';
import 'package:zchat/shared/components/components.dart';

import '../../shared/styles/colors/colors.dart';

class HomeLayout extends StatelessWidget {
   HomeLayout({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> scaffoldKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        return DefaultTabController(
          length: cubit.tapsList.length,
          child: SafeArea(
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(

                title:const Text(
                  "ZCHAT",
                  style: TextStyle(fontSize: 25, color: defaultColor),
                ),
                titleSpacing: 30,
                actions: [
                  IconButton(
                    onPressed: () {
                      HomeCubit.get(context).showBottomSheet(context,cubit.firstNameController,cubit.lastNameController,cubit.phoneController);

                    },
                    icon: SvgPicture.asset(
                      'assets/icons/Add.svg',
                      height: 15,
                      width: 15,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());

                    },
                    icon: SvgPicture.asset(
                      'assets/icons/Search.svg',
                      height: 18,
                      width: 18,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if(scaffoldKey.currentState!.isEndDrawerOpen){
                        scaffoldKey.currentState!.closeEndDrawer();
                        //close drawer, if drawer is open
                      }else{
                        scaffoldKey.currentState!.openEndDrawer();
                        //open drawer, if drawer is closed
                      }
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/Vector.svg',
                    ),
                  ),
                ],
                bottom: TabBar(
                  indicatorSize: TabBarIndicatorSize.tab,
                  onTap: (index) {
                    HomeCubit.get(context).changeTabBar(index);
                  },
                  tabs:  HomeCubit.get(context).tapsList,
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
                  indicatorPadding: EdgeInsets.zero,
                  indicatorColor: defaultColor,

                  // add it here
                  indicator: RectangularIndicator(
                    verticalPadding: 5,
                    horizontalPadding: 5,
                    color: defaultColor,
                    bottomLeftRadius: 60,
                    bottomRightRadius: 60,
                    topLeftRadius: 60,
                    topRightRadius: 60,
                    paintingStyle: PaintingStyle.fill,
                  ),
                ),
              ),
              body: cubit.screens[cubit.currentIndex],
              endDrawer : buildHomeDrawer(context),
              // This trailing comma makes auto-formatting nicer for build methods.
            ),
          )
        );
      },
    );
  }

// AppBar appBarWidget(context)=>AppBar(
//
//   title:const Text(
//     "ZCHAT",
//     style: TextStyle(fontSize: 25, color: defaultColor),
//   ),
//   titleSpacing: 30,
//   actions: [
//     IconButton(
//       onPressed: () {
//       },
//       icon: SvgPicture.asset(
//         'assets/icons/Add.svg',
//         height: 15,
//         width: 15,
//       ),
//     ),
//     IconButton(
//       onPressed: () {
//         navigateTo(context, SearchScreen());
//
//       },
//       icon: SvgPicture.asset(
//         'assets/icons/Search.svg',
//         height: 18,
//         width: 18,
//       ),
//     ),
//     IconButton(
//       onPressed: () {
//         if(scaffoldKey.currentState!.isEndDrawerOpen){
//           scaffoldKey.currentState!.closeEndDrawer();
//           //close drawer, if drawer is open
//         }else{
//           scaffoldKey.currentState!.openEndDrawer();
//           //open drawer, if drawer is closed
//         }
//       },
//       icon: SvgPicture.asset(
//         'assets/icons/Vector.svg',
//       ),
//     ),
//   ],
//   bottom: TabBar(
//     indicatorSize: TabBarIndicatorSize.tab,
//     onTap: (index) {
//       HomeCubit.get(context).changeTabBar(index);
//     },
//     tabs:  HomeCubit.get(context).tapsList,
//     labelColor: Colors.white,
//     unselectedLabelColor: Colors.black,
//     indicatorPadding: EdgeInsets.zero,
//     indicatorColor: defaultColor,
//
//     // add it here
//     indicator: RectangularIndicator(
//       verticalPadding: 5,
//       horizontalPadding: 5,
//       color: defaultColor,
//       bottomLeftRadius: 60,
//       bottomRightRadius: 60,
//       topLeftRadius: 60,
//       topRightRadius: 60,
//       paintingStyle: PaintingStyle.fill,
//     ),
//   ),
// );


}



