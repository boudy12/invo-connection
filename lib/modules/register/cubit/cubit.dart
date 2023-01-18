import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/modules/register/cubit/states.dart';
import 'package:invoconnection/shared/network/remote/dio_helper.dart';

class ConnectionAppRegisterCubit extends Cubit<ConnectionAppRegisterStates>{

  ConnectionAppRegisterCubit() : super(ConnectionAppRegisterInitialState());

  static ConnectionAppRegisterCubit get(context)=> BlocProvider.of(context);

 // ConnectionAppUseLoginModel? shopRegisterModel;

  IconData suffixRegister = Icons.remove_red_eye_outlined;
  IconData suffixConfirm = Icons.remove_red_eye_outlined;
  bool isPasswordRegister = true;
  bool isPasswordConfirm = true;

  void changIconPasswordRegisterState(){
    isPasswordRegister = !isPasswordRegister;
    suffixRegister = isPasswordRegister? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ConnectionAppLoginShowPasswordRegisterState());
  }
  void changIconPasswordConfirmState(){
    isPasswordConfirm = !isPasswordConfirm;
    suffixConfirm = isPasswordConfirm? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ConnectionAppLoginShowPasswordConfirmState());
  }

//   late ConnectionAppUseLoginModel eCommerceAppUseRegisterModel ;
//
//   void userRegister({
//   required String email,
//   required String password,
//   required String confirmPassword,
//   required String name,
// })
//   {
//     emit(ConnectionAppRegisterLoadingState());
//     DioHelper.postData(
//         url: 'register',
//         data: {
//           'email':email,
//           'password':password,
//           'name':name,
//           'password_confirmation':confirmPassword,
//         },
//       lang: 'en'
//     ).then((value) {
//       eCommerceAppUseRegisterModel = ConnectionAppUseLoginModel.fromJson(value.data);
//       emit(ConnectionAppRegisterSuccessState());
//       print(eCommerceAppUseRegisterModel.data!.email);
//       print(eCommerceAppUseRegisterModel.data!.name);
//     }).catchError((error){
//       print(error.toString());
//       emit(ConnectionAppRegisterErrorState(error.toString()));
//     });
//   }


}