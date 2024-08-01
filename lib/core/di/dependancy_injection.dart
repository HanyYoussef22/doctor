import 'package:dio/dio.dart';
import 'package:doc_app/core/networking/api_service.dart';
import 'package:doc_app/core/networking/dio_factory.dart';
import 'package:doc_app/feathures/login/logic/cubit/login_cubit.dart';
import 'package:doc_app/feathures/login/logic/data/repo/login_repo.dart';
import 'package:get_it/get_it.dart';

final getit = GetIt.instance;

Future<void> setUpGetIt() async {
  Dio dio = DioFactory.getDio();
  // dio & ApiService
  getit.registerLazySingleton<ApiService>(() => ApiService(dio));
  //login
  getit.registerLazySingleton<LoginRepo>(() => LoginRepo(getit()));
  getit.registerLazySingleton<LoginCubit>(() => LoginCubit(getit()));
}
