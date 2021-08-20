import 'package:dio/dio.dart';

class DioHelpper{
  static late  Dio dio;
 static init(){
   dio=Dio(
       BaseOptions(
         baseUrl:'https://student.valuxapps.com/api/' ,
         receiveDataWhenStatusError: true,

       )
   );
 }

 static Future<Response> getData({required String url,  Map<String,dynamic>? quary,String lang='en',String? token}) async{
   dio.options.headers={

     'Content-Type':'application/json',
     'lang':lang,
     'Authorization':token??''
   };

  return  await dio.get(url,queryParameters:quary,);
 }

 static Future<Response> postData
     ({
  required String url,Map<String,dynamic>? quary,required Map<String,dynamic> data,String lang='en',String? token
})async{
   dio.options.headers={
     'Content-Type':'application/json',
     'lang':lang,
     'Authorization':token??''

   };
   return dio.post(
     url,
   queryParameters: quary,
   data: data);

 }

  static Future<Response> PutData
      ({
    required String url,Map<String,dynamic>? quary,required Map<String,dynamic> data,String lang='en',String? token
  })async{
    dio.options.headers={
      'Content-Type':'application/json',
      'lang':lang,
      'Authorization':token??''

    };
    return dio.put(
        url,
        queryParameters: quary,
        data: data);

  }
}