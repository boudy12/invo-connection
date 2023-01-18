import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:invoconnection/layout/connection_layout.dart';
import 'package:invoconnection/layout/cubit/cubit.dart';
import 'package:invoconnection/admin/layout/cubit/cubit.dart';

import 'package:invoconnection/shared/Bloc_Observer.dart';
import 'package:invoconnection/shared/components/constants.dart';
import 'package:invoconnection/shared/cubit/cubit.dart';
import 'package:invoconnection/shared/cubit/states.dart';
import 'package:invoconnection/shared/lang/localString.dart';
import 'package:invoconnection/shared/network/local/cache_helper.dart';
import 'package:invoconnection/shared/network/remote/dio_helper.dart';
import 'package:invoconnection/styles/Themes.dart';
class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}

void main() async
{

  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  isDark1 =  CacheHelper.getData(key: 'isDark') ?? false;
  //
   isArabic1 =  CacheHelper.getData(key: 'isArabic') ?? false;
  //
  // bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  //
  // token = CacheHelper.getData(key: 'token');
  //userId = CacheHelper.getData(key: 'userId');
  // print(token);
  // print(userId);
  // print(isArabic1);
  // print(isDark1);
 // Widget widget;

  // if(onBoarding != null)
  // {
  //   if(token != null)
  //   {
  //     widget = ECommerceLayoutScreen();
  //   }
  //   else{
  //     widget = ECommerceAppLoginScreen();
  //   }
  // }
  // else{
  //   widget = OnBoardingScreen();
  // }

 //  runApp(DevicePreview(
 //    builder:(context) => MyApp(
 //      isDark: isDark1,
 // //   startWidget: widget,
 //      isArabic : isArabic1,
 //    ),
 //  ));
  runApp(MyApp(
    isDark: isDark1,
    //   startWidget: widget,
    isArabic : isArabic1,
  ));
}


class MyApp extends StatelessWidget {

  final bool? isDark;
  final bool? isArabic;
 // final Widget startWidget;

  MyApp({
    this.isDark,
 //   required this.startWidget,
    this.isArabic
  });

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()..changeMode(fromShared: isDark)..changeLanguage(fromShared: isArabic),),
        BlocProvider(create: (context) => ConnectionsAppCubit()),
        BlocProvider(create: (context) => ConnectionsAppAdminCubit()),
      ],
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return GetMaterialApp(
      //      builder: DevicePreview.appBuilder,
            translations: LocalString(),
            locale: isArabic1? Locale('ar','AR'): Locale('en','US'),
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: isDark1? ThemeMode.dark : ThemeMode.light,
            debugShowCheckedModeBanner: false,
            home: Directionality(
              //  textDirection: TextDirection.ltr,
                textDirection: isArabic1? TextDirection.rtl : TextDirection.ltr,
                child: ConnectionAppLayoutScreen()
            ),
          );
        },

      ),
    );
  }
// This widget is the root of your application.

}
