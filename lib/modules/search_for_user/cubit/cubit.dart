import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/modules/search_for_user/cubit/states.dart';

class ConnectionAppSearchUsersCubit extends Cubit<ConnectionAppSearchUserStates> {
  ConnectionAppSearchUsersCubit() : super(ConnectionAppSearchUserInitialStates());

  static ConnectionAppSearchUsersCubit get(context) => BlocProvider.of(context);

  //late SearchModel searchModel;


  // void search({
  //   required String text ,
  // }) {
  //   emit(ConnectionAppSearchLoadingStates());
  //
  //   DioHelper.postData(
  //     url: SEARCH,
  //     token: token,
  //     data: {
  //       'text':text,
  //     },
  //   ).then((value) {
  //     searchModel = SearchModel.fromJson(value.data);
  //     emit(ConnectionAppSearchSuccessStates());
  //     print(searchModel!.data!.data!.length);
  //   }).catchError((error){
  //     print(error.toString());
  //     emit(ConnectionAppSearchErrorStates(error.toString()));
  //   });
  // }
}