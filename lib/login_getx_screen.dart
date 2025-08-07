import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:merdeka_app/controllers/login_controller.dart';
import 'components/custom_button.dart';

class LoginGetxScreen extends GetView<LoginController> {

  const LoginGetxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: formLogin1(height, width, context)
    );
  }

  Widget formLogin1(double height, double width, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: width,
            height: height * 0.25,
            color: Colors.greenAccent,
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 72, left: 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome to"),
                      Text("Merdeka Mobile", style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 18))
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 16,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16)
                        )
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(16),
            width: width,
            //height: height * 0.75,
            color: Colors.white,
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Email/Username")
                ),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    hintText: "Masukkan username atau email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Password")
                ),
                Obx(() {
                  return TextField(
                    obscureText: controller.isObscurePassword.value,
                    controller: controller.passwordController,
                    decoration: InputDecoration(
                        hintText: "Password",
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.showHidePassword();
                            },
                            icon: Icon(controller.isObscurePassword.value
                                ? Icons.visibility_off
                                : Icons.visibility
                            )
                        )
                    ),
                  );
                }),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: () {
                          debugPrint("lupa pass");
                        },
                        child: Text("Lupa Password")
                    )
                ),
                SizedBox(height: 16),
                Obx(() {
                  if (controller.isLoading.value) {
                    return CircularProgressIndicator();
                  }
                  else {
                    return CustomButton(
                        title: "Login",
                        onPressed: () async {
                          //controller.login();

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(builder: (context) => NewsGetxScreen()))
                          //     .then((value){
                          //       debugPrint("value: $value");
                          // });

                          var result = await Get.toNamed("/news");
                          debugPrint("value: $result");
                        }
                    );
                  }
                })
              ],
            ),
          ),
        ],
      ),
    );
  }

}
