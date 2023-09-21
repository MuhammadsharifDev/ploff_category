import 'package:dio/dio.dart';
import 'package:ploff_part/core/server_error.dart';

import '../data/model/banner_response.dart';

class BannerRepository {
  final dio = Dio()
    ..options = BaseOptions(
      baseUrl: 'https://test.customer.api.delever.uz',
      headers: {'Shipper': 'd4b1658f-3271-4973-8591-98a82939a664'},
      contentType: 'application/json',
      sendTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
    )
    ..interceptors.addAll([
      LogInterceptor(requestBody: true, responseBody: true),
    ]);

  Future<BannerResponse> bannerRepo() async {
    try {
      final response = await dio.get('/v1/banner');
      if (response.statusCode == 200 || response.statusCode == 201) {
        return BannerResponse.fromJson(response.data);
      }
      throw ServerException.fromJson(response.data);
    }on DioException catch(e){
      throw ServerException.fromJson(e.response?.data);
    }
  }

}