import 'package:dio/dio.dart';
import 'package:ploff_part/core/server_error.dart';
import 'package:ploff_part/home/data/model/category_response.dart';
import 'package:ploff_part/home/data/model/getcategory_response.dart';

class CategoryRepository {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: 'https://test.customer.api.delever.uz',
      headers: {'Shipper': 'd4b1658f-3271-4973-8591-98a82939a664'},
      contentType: 'application/json',
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(
        seconds: 300,
      ),
    )
    ..interceptors.addAll(
      [
        LogInterceptor(responseBody: true, requestBody: true),
      ],
    );

  Future<CategoryResponse> category() async {
    try {
      final response = await dio.get('/v1/category');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return CategoryResponse.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response?.data != null) {
        throw ServerException.fromJson(e.response?.data);
      } else {
        throw ServerException(message: 'Something went wrong with the server.');
      }
    }
  }

  Future<GetCategoryResponse> getCategory() async {
    try {
      final response = await dio.get('/v2/category-with-products');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return GetCategoryResponse.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    } on DioException catch (e) {
      throw ServerException.fromJson(e.response?.data);
    }on FormatException{
      throw ServerException(message:'Somethings is Errrorrrrrr>>>');
    }
  }
}
