import 'package:get/get.dart';
import 'package:merdeka_app/controllers/login_controller.dart';

class Binding implements Bindings{

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }

}