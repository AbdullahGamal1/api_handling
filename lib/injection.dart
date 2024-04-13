import 'package:apis/cubit/my_cubit.dart';
import 'package:apis/my_repo.dart';
import 'package:apis/web_serveses.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initGetIt() {
  getIt.registerLazySingleton<MyCubit>(() => MyCubit(getIt()));
  getIt.registerLazySingleton<MyRepo>(() => MyRepo(getIt()));
  getIt.registerLazySingleton<WebServices>(
      () => WebServices(createAndSetupDio()));
}

Dio createAndSetupDio() {
  Dio dio = Dio();
  // dio
  //   ..options.connectTimeout = 1 * 1000
  //   ..options.receiveTimeout = 10 * 1000 ;
  // ..options.connectTimeout = (1 * 1000) as Duration
  // ..options.receiveTimeout = (10 * 1000) as Duration ;
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    error: true,
    request: true,
    requestHeader: false,
    responseHeader: false,
    responseBody: true,
  ));

  return dio;
}
