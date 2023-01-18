import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/modules/login/cubit/states.dart';
import 'package:invoconnection/shared/components/components.dart';
import 'package:invoconnection/shared/components/constants.dart';
import 'package:invoconnection/shared/cubit/cubit.dart';
import 'package:invoconnection/shared/network/remote/dio_helper.dart';

class ConnectionAppLoginCubit extends Cubit<ConnectionAppLoginStates>{

  ConnectionAppLoginCubit() : super(ConnectionAppLoginInitialState());

  static ConnectionAppLoginCubit get(context)=> BlocProvider.of(context);

 // late ConnectionAppUseLoginModel shopLoginModel;

  IconData suffix = Icons.remove_red_eye_outlined;
  bool isPasswordLogin = true;

  void changIconPasswordLoginState(){
    isPasswordLogin = !isPasswordLogin;
    suffix = isPasswordLogin? Icons.remove_red_eye_outlined : Icons.visibility_off_outlined;
    emit(ConnectionAppLoginShowPasswordLoginState());
  }


//   late ConnectionAppUseLoginModel eCommerceAppUseLoginModel ;
//   void userLogin({
//   required String email,
//   required String password,
// })
//   {
//     emit(ConnectionAppLoginLoadingState());
//     DioHelper.postData(
//         url: 'login',
//         data: {
//           'email':email,
//           'password':password,
//         },
//
//     ).then((value) {
//       eCommerceAppUseLoginModel = ConnectionAppUseLoginModel.fromJson(value.data);
//       emit(ConnectionAppLoginSuccessState());
//     }).catchError((error){
//       print(error.toString());
//       emit(ConnectionAppLoginErrorState(error.toString()));
//     });
//   }
//
//   void printName(){
//     showToast(
//         msg:  eCommerceAppUseLoginModel.token!,
//         state: ToastStates.SUCCESS
//     );
//   }

}