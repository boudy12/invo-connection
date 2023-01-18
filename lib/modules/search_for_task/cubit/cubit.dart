import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:invoconnection/modules/search_for_task/cubit/states.dart';

class ConnectionAppSearchTasksCubit extends Cubit<ConnectionAppSearchTasksStates> {
  ConnectionAppSearchTasksCubit() : super(ConnectionAppSearchTasksInitialStates());

  static ConnectionAppSearchTasksCubit get(context) => BlocProvider.of(context);

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