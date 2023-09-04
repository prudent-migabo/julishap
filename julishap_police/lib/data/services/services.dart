

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:julishap_police/data/data.dart';

class Services{


  static Future get(String url)async{
    try{
      Response response= await Dio().get(url);

      if(response.statusCode! >= 400){
        throw CustomError(code: 'Error', message: response.data.toString(), plugin: '');
      }
      print('rrrrrrr${response.data}');

      return response.data;

    }catch(e){
      print('iiiiiiiii${e}');
      throw CustomError(code: 'Error', message: e.toString(), plugin: '');

    }
  }
}

