import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/layout/cubit/states.dart';
import 'package:invoconnection/modules/chat/chat_screen.dart';
import 'package:invoconnection/modules/discover/discover_screen.dart';
import 'package:invoconnection/modules/favorites/favorites_screen.dart';
import 'package:invoconnection/modules/home/home_screen.dart';
import 'package:invoconnection/modules/setting/setting_screen.dart';

class ConnectionsAppCubit extends Cubit<ConnectionsAppStates>{


  ConnectionsAppCubit() : super(ConnectionsAppInitialState());

  static ConnectionsAppCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    emit(ConnectionsAppBottomNavBarState());
  }

  List<Widget> screens = [
    ConnectionAppHomeScreen(),
    ConnectionAppDiscoverScreen(),
    ConnectionAppAllChatsScreen(),
    ConnectionAppFavoritesScreen(),
    ConnectionAppSettingScreen(isAdmin: false,),
  ];

}