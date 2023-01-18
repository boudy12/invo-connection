import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:invoconnection/admin/layout/cubit/states.dart';
import 'package:invoconnection/admin/modules/add_tasks/add_tasks.dart';
import 'package:invoconnection/admin/modules/all_employees/all_employees_screen.dart';
import 'package:invoconnection/admin/modules/all_tasks/all_tasks%20.dart';
import 'package:invoconnection/admin/modules/chat/chat_screen.dart';
import 'package:invoconnection/admin/modules/setting/setting.dart';
import 'package:invoconnection/modules/chat/chat_screen.dart';
import 'package:invoconnection/modules/discover/discover_screen.dart';
import 'package:invoconnection/modules/favorites/favorites_screen.dart';
import 'package:invoconnection/modules/home/home_screen.dart';
import 'package:invoconnection/modules/setting/setting_screen.dart';

class ConnectionsAppAdminCubit extends Cubit<ConnectionsAppAdminStates>{


  ConnectionsAppAdminCubit() : super(ConnectionsAppAdminInitialState());

  static ConnectionsAppAdminCubit get(context) => BlocProvider.of(context);


  int currentIndex = 0;

  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    emit(ConnectionsAppAdminBottomNavBarState());
  }

  List<Widget> screens = [
    AllTasksScreen(),
    AllEmployeesScreen(),
    AddTasksScreen(),
    ConnectionAppAdminAllChatsScreen(),
    ConnectionAppSettingScreen(isAdmin: true,),
  ];

  File? addImage;

  var picker = ImagePicker();

  Future<void> getAddImage() async
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null)
    {
      addImage = File(pickedFile.path);
      emit(ConnectionsAppAdminAddImagePickedGetSuccessState());
    }else{
      print("no image selected");
      emit(ConnectionsAppAdminAddImagePickedGetErrorState());
    }

  }

  void removeAddedImage(){
    addImage = null;
    emit(ConnectionsAppAdminRemoveAddedImagePickedState());


  }


  File? updateImage;


  Future<void> getUpdateImage() async
  {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null)
    {
      updateImage = File(pickedFile.path);
      emit(ConnectionsAppAdminUpdateImagePickedGetSuccessState());
    }else{
      print("no image selected");
      emit(ConnectionsAppAdminUpdateImagePickedGetErrorState());
    }

  }
  void removeUpdateImage(){
    updateImage = null;
    emit(ConnectionsAppAdminRemoveUpdateImagePickedState());


  }

}