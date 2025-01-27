
import 'package:dio/dio.dart';
import 'package:doc_app/core/networking/api_constants.dart';

import 'package:doc_app/feathures/login/logic/data/login_request_body.dart';
import 'package:doc_app/feathures/login/logic/data/login_response.dart';

import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.apiBaseUrl )
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;


@POST(ApiConstant.login)
Future<LoginResponse> login(@Body()LoginRequestBody  loginRequestBody);

}
