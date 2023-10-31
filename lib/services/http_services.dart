import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:stacked_services/stacked_services.dart';

import '../app/app.locator.dart';
import '../app/app.logger.dart';

class MyHttpServices {
  final _log = getLogger('MyHttpServices');
  final _snackbarService = locator<SnackbarService>();
  final _options = BaseOptions(
    baseUrl: dotenv.env['api_url']!,
    connectTimeout: const Duration(milliseconds: 60000),
    receiveTimeout: const Duration(milliseconds: 60000),
  );

  late Dio _dio;

  MyHttpServices() {
    _dio = Dio(_options);
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } on DioException catch (e) {
      String response = e.response != null
          ? e.response!.data['message'].toString()
          : e.toString();
      _log.e('ini errornya: $response');
      _snackbarService.showSnackbar(
        message: response,
        title: 'Error',
        duration: const Duration(milliseconds: 1000),
      );
      rethrow;
    }
  }

  Future<Response> postWithFormData(String path, FormData formData) async {
    try {
      return await _dio.post(path, data: formData);
    } on DioException catch (e) {
      String response = e.response != null
          ? e.response!.data['message'].toString()
          : e.toString();
      _log.e('ini errornya: $response');
      _snackbarService.showSnackbar(
        message: response,
        title: 'Error',
        duration: const Duration(milliseconds: 1000),
      );
      rethrow;
    }
  }
}
