import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shaky_animated_listview/animators/grid_animator.dart';
import 'package:shaky_animated_listview/widgets/animated_listview.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:zchat/layout/profile/cubit/cubit.dart';
import 'package:zchat/layout/profile/cubit/states.dart';
import 'package:zchat/models/user/user_model.dart';
import 'package:zchat/moduels/chat/chat_screen.dart';
import 'package:zchat/shared/components/components.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class ProfileLayout extends StatelessWidget {
 final UserModel? model;

  ProfileLayout({required this.model, });



  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: BlocConsumer<ProfileCubit, ProfileStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = ProfileCubit.get(context);

          return DefaultTabController(
              length: cubit.tapsList.length,
              child: SafeArea(
                child: Scaffold(
                    key: scaffoldKey,
                    backgroundColor: Colors.white,
                    body: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            buildCustomAppBar(context),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                Container(
                                  margin:const EdgeInsets.only(left: 10),
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                  height: MediaQuery.of(context).size.height *
                                      0.08,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        image: AssetImage(
                                            '${model!.image}'),
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                const SizedBox(
                                  width: 18,
                                ),
                                Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width * 0.5,
                                      child: Text(
                                        '${model!.name} ',
                                        maxLines: 2,
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontFamily: 'Gilroy',
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${model!.isOnline == true?'Online':'Offline'}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .caption!
                                          .copyWith(
                                              fontSize: 14,
                                              color:model!.isOnline == true? defaultColor:Colors.grey,
                                              letterSpacing: 1),
                                    ),
                                  ],
                                ),
                              const  Spacer(),
                                InkWell(
                                  onTap: () {
                                    navigateTo(context, ChatScreen(model: model,));
                                  },
                                  child: SvgPicture.asset(
                                    'assets/icons/message-call.svg',
                                    color: defaultColor,
                                  height: 20,
                                  width: 20,

                                  ),
                                ),
                                const  SizedBox(
                                  width: 10,
                                )
                              ],
                            ),
                            const    SizedBox(height: 40),
                            Container(
                              margin: const EdgeInsets.only(left: 15),
                              child: const Text(
                                'Phone number',
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.black,
                                  fontFamily: 'Gilroy',
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            const  SizedBox(height: 10),
                            Container(
                              margin:const EdgeInsets.only(left: 15),
                              child: Text(
                                '${cubit.getFormattedPhoneNumber(model!.phone)}',
                                style: Theme.of(context)
                                    .textTheme
                                    .caption!
                                    .copyWith(
                                      fontSize: 16,
                                      color: Colors.black87,
                                    ),

                              ),
                            ),
                            const  SizedBox(height: 20),
                            TabBar(
                              indicatorSize: TabBarIndicatorSize.tab,
                              onTap: (index) {
                                cubit.changeTabBarProfile(index);
                              },
                              tabs: cubit.tapsList,
                              labelColor: Colors.white,
                              unselectedLabelColor: Colors.black,
                              indicatorPadding: EdgeInsets.zero,
                              indicatorColor: defaultColor,

                              // add it here
                              indicator: RectangularIndicator(
                                verticalPadding: 8,
                                horizontalPadding: 12,
                                color: defaultColor,
                                bottomLeftRadius: 60,
                                bottomRightRadius: 60,
                                topLeftRadius: 60,
                                topRightRadius: 60,
                                paintingStyle: PaintingStyle.fill,
                              ),
                            ),
                            SizedBox(height: 20),

                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height *0.55,
                                child: cubit.widgets[cubit.currentIndex],
                                // cubit.widgets[cubit.currentIndex]
                            )


                          ]),
                    )

                    // body: cubit.screens[cubit.currentIndex],

                    // This trailing comma makes auto-formatting nicer for build methods.
                    ),
              ));
        },
      ),
    );
  }

  Widget buildCustomAppBar(context)=>  Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: defaultColor,
            size: 15,
          ),
        ),
         Align(
            alignment: Alignment.center,
            child: Text(
              '@${model!.name}',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w600,
                color: defaultColor,
              ),
            )),
      ]);


}
