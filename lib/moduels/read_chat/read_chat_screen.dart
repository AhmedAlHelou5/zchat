import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zchat/layout/home/cubit/cubit.dart';
import 'package:zchat/layout/home/cubit/states.dart';
import 'package:zchat/moduels/chat/chat_screen.dart';
import 'package:zchat/shared/components/components.dart';

class ReadChatScreen extends StatelessWidget {
  const ReadChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = HomeCubit.get(context).listUser;

    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        // var list = HomeCubit.get(context);
        return readChatBuilder(items, context);
      },
    );
  }
}
