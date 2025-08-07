import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merdeka_app/model/LoginRequest.dart';
import 'package:merdeka_app/model/LoginResponse.dart';
import 'package:merdeka_app/services/login_service.dart';

class LoginController extends GetxController{

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isObscurePassword = true.obs;
  void showHidePassword(){
    isObscurePassword.value = !isObscurePassword.value;
  }

  var isLoading = false.obs;
  var errorMessage = "".obs;
  var loginData = Rx<LoginResponse?>(null);

  Future<void> login() async{

    var email = emailController.text;
    var password = passwordController.text;
    if (email.isEmpty || password.isEmpty){
      Get.snackbar(
          "Error",
          "Lengkapi yang kosong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white
      );
      return;
    }

    isLoading.value = true;
    try{
      var loginRequest = LoginRequest(username: email, password: password);
      var loginResponse = await LoginService.login(loginRequest);

      loginData.value = loginResponse;
      errorMessage.value = '';
      // Get.offNamed("/news");
      // Get.toNamed("/news");
    } catch (e){
      errorMessage.value = e.toString();
      Get.snackbar(
          "Error",
          e.toString(),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent,
          colorText: Colors.white
      );
    } finally {
      isLoading.value = false;
    }
  }

}
