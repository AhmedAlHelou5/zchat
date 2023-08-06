import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:zchat/layout/home/cubit/cubit.dart';
import 'package:zchat/layout/home/cubit/states.dart';
import 'package:zchat/moduels/chat/chat_screen.dart';
import 'package:zchat/shared/components/components.dart';
import 'package:zchat/shared/styles/colors/colors.dart';

class UnreadChatScreen extends StatelessWidget {
  const UnreadChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = HomeCubit.get(context).listUser;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return unreadChatBuilder(items, context);
      },
    );
  }
}
