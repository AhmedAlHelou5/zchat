import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zchat/layout/home/cubit/cubit.dart';
import 'package:zchat/layout/home/cubit/states.dart';
import 'package:zchat/moduels/call/call_screen.dart';
import 'package:zchat/moduels/call_history/cubit/cubit.dart';
import 'package:zchat/shared/components/components.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class CallHistoryScreen extends StatelessWidget {
   CallHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = CallHistoryCubit.get(context).listCallHistory;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // var list = HomeCubit.get(context);
        return Scaffold(
        appBar:appBarWidget(context),
        body: callHistoryBuilder(items, context));
      });
      // Scaffold(
    //   appBar: AppBar(
    //     title: Text(
    //       'Call History',
    //       style: TextStyle(
    //           color: defaultColor,
    //           fontSize: 18,
    //           letterSpacing: 1,
    //           fontFamily: 'Gilroy'),
    //     ),
    //     centerTitle: true,
    //     leading: IconButton(
    //       onPressed: () {
    //         Navigator.pop(context);
    //       },
    //       icon: Icon(
    //         Icons.arrow_back_ios,
    //         color: defaultColor,
    //         size: 16,
    //       ),
    //     ),
    //   ),
    //   backgroundColor: Colors.white,
    //     body: ListView.separated(
    //         separatorBuilder: (context, index) => SizedBox(
    //           height: 10,
    //         ),
    //         itemBuilder: (context, index) {
    //           return items[index];
    //         },
    //         itemCount: items.length)
    //
    //
    //
    //
    // );
  }


   AppBar appBarWidget(context)=>AppBar(
    title: Text(
      'Call History',
      style: TextStyle(
          color: defaultColor,
          fontSize: 18,
          letterSpacing: 1,
          fontFamily: 'Gilroy'),
    ),
    centerTitle: true,
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        color: defaultColor,
        size: 16,
      ),
    ),
  );
}
