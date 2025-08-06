import 'package:dio/dio.dart';
import 'package:merdeka_app/model/LoginRequest.dart';
import 'package:merdeka_app/model/LoginResponse.dart';

class LoginService {

  static Future<LoginResponse> login(LoginRequest loginRequest) async {
    try{
      final dio = Dio();

      var response = await dio.post(
          'https://dummyjson.com/auth/login',
          data: loginRequest.toJson(),
          options: Options(
              headers: {'Content-Type':'application/json'}
          )
      );

      var loginResponse = LoginResponse.fromJson(response.data);
      return loginResponse;
    } on DioException catch (exc){
      String errorMessage = exc.response?.data["message"] ?? "Error";
      throw errorMessage;
    }
  }

}