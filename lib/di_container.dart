import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:nahin_portfolio/util/app_constants/app_constants.dart';
import 'package:nahin_portfolio/util/helper/sharepreference_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'core/network/remote/dio/dio_client.dart';
import 'core/network/remote/dio/logging_interceptor.dart';
import 'features/auth/controller/login_controller.dart';
import 'features/auth/data/repo/auth_repo.dart';
import 'features/splash/controller/splash_controller.dart';
import 'features/portfolio/controller/portfolio_controller.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// Core
  sl.registerLazySingleton(() => DioClient(
        AppConstants.baseUrl,
        sl(),
        loggingInterceptor: sl(),
        sharedPreferences: sl(),
      ));

  /// Repository
  sl.registerLazySingleton(
      () => AuthRepo(dioClient: sl(), sharedPreferencesClass: sl()));

  /// Controller
  Get.lazyPut(() => SplashController(), fenix: true);
  Get.lazyPut(
      () => LoginController(
          authRepo: sl(), dioClient: sl(), sharedPreferencesClass: sl()),
      fenix: true);
  Get.lazyPut(() => PortfolioController(), fenix: true);

  /// External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => SharedPreferencesClass());
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => LoggingInterceptor());
}
