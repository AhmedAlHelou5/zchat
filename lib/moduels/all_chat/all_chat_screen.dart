import 'package:flutter/material.dart';
import 'package:zchat/moduels/chat/chat_screen.dart';
import 'package:zchat/shared/components/components.dart';

class AllChatScreen extends StatelessWidget {
   AllChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = List<Widget>.generate(10, (i) => buildSlideChatItem(context, InkWell(onTap: ()=>navigateTo(context, ChatScreen()),child: buildAllChatItem(context))));

    return Scaffold(

        backgroundColor: Colors.white,
        body: ListView.builder(
            itemBuilder: (context, index) {
             return items[index];
            },
            itemCount: items.length)

         );
  }



}
