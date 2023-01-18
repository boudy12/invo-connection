import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:invoconnection/shared/components/constants.dart';

class DioHelper{

  static late Dio dio;

  static init()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://invostoreapi.invoacdmy.com/api/',
        receiveDataWhenStatusError: true,

      ),
    );
  }
  
  static Future<Response> getData({
  required String url,
  Map<String , dynamic>? query ,
  String? token,
  String? lang,

}) async
  {
    dio.options.headers = {
       'Authorization':token??'' ,
    };
    return await dio.get(
      url,
      queryParameters: {
        'api_password':'invoworkhard',
        'lang':lang
      },
    );
  }


  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String , dynamic> data ,
    String? token,
    String? lang,
  }) async
  {
    dio.options.headers = {

       'Authorization':token??'' ,
      'api_password':'invoworkhard',
    };
    return await dio.post(
      url,
      queryParameters: {
        'api_password':'invoworkhard',
        'lang':lang

      },
      data: data,
    );
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    required Map<String , dynamic> data ,
    String? token,
    String? lang ,
  }) async
  {
    dio.options.headers = {
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??'' ,
    };
    return await dio.put(
        url,
        queryParameters: {
          'api_password':'invoworkhard',
          'lang':lang

        },
        data: data
    );
  }
}