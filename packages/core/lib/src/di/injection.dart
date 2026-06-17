/**
 * Developer: CORZ (https://www.linkedin.com/in/omar-ramirez-6a51b7141/)
 * Date: 2024-10-24
 * Description: DI Configuration for the Core module.
 * Relevant Info: Uses Injectable MicroPackage pattern. */

import 'package:core/src/constants/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

@module
abstract class CoreModule {
  @lazySingleton
  Dio get dio {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        headers: {'Accept': 'application/json'},
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printResponseData: true,
          printResponseHeaders: false,
          printResponseMessage: false,
          printRequestHeaders: false,
        ),
      ),
    );
    return dio;
  }
}

@InjectableInit.microPackage()
void initMicroPackage() {}
