import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zchat/bloc_observer.dart';
import 'package:zchat/layout/home/cubit/cubit.dart';
import 'package:zchat/moduels/call/cubit/cubit.dart';
import 'package:zchat/moduels/call_history/cubit/cubit.dart';
import 'package:zchat/moduels/splash/splash_screen.dart';
import 'package:zchat/shared/cubit/app_cubit.dart';
import 'package:zchat/shared/cubit/app_states.dart';
import 'package:zchat/shared/network/local/cache_helper.dart';
import 'package:zchat/shared/styles/styles/themes.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
     const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white,
    statusBarColor: Colors.white,
    statusBarIconBrightness: Brightness.dark,
    statusBarBrightness: Brightness.light,

  ));
  await CacheHelper.init();
  bool? isDark = CacheHelper.getData(key: 'isDark');
  // WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp( MyApp(isDark: isDark));
}

class MyApp extends StatelessWidget {
  final bool? isDark;

  MyApp({this.isDark});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
        create: (context) =>AppCubit()..changeAppMode(fromShared: true),),
        BlocProvider(
          create: (context) =>HomeCubit()..getUserData()),
        BlocProvider(
            create: (context) =>CallHistoryCubit()..getCallHistoryData()),
        BlocProvider(
            create: (context) =>CallCubit()),
      ],

        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              darkTheme: darkTheme,
              themeMode: ThemeMode.light,
              home: SplashScreen(),
            );
          },
        ),

    );
  }
}

