import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zchat/layout/home/cubit/cubit.dart';
import 'package:zchat/layout/home/cubit/states.dart';
import 'package:zchat/shared/components/components.dart';


class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  var controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var list = HomeCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFormField(
                      controller: controller,
                      type: TextInputType.text,
                      onChange: (value) {
                        HomeCubit.get(context).getSearch(value);
                      },
                      validate: (value) {
                        if (value!.isEmpty) {
                          return 'Search must not be empty';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search_rounded),
                ),
                Expanded(child: allChatBuilder(list, context,isSearch: true))
              ]
          ),
        );
      },
    );
  }
}
