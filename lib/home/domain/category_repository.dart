import 'package:dio/dio.dart';
import 'package:ploff_part/core/server_error.dart';
import 'package:ploff_part/home/data/model/gecategory_response.dart';

class CategoryRepository {
  final dio=Dio()..options=BaseOptions(

    contentType: 'application/json',
    sendTimeout: const Duration(seconds: 30),
    receiveTimeout: const Duration(seconds: 30),
    connectTimeout: const Duration(
      seconds: 300,
    ),)..interceptors.addAll(
    [
      LogInterceptor(
          responseBody: true,
          requestBody: true
      ),
    ],
  );
  
  Future<GetCategoriesResponse>  getCategory()async{
   try{
     final response= await dio.get('https://test.customer.api.delever.uz/v2/category-with-products');
     if(response.statusCode==200 || response.statusCode==201){
     return GetCategoriesResponse.fromJson(response.data);
     }
     throw ServerException.fromJson(response.data);
   }on DioException catch(e){
     throw ServerException.fromJson(e.response?.data);
   } on FormatException{
     throw ServerException(message: 'Something is errorrrrrrrrr');
   }
  }
}