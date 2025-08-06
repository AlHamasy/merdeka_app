import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:merdeka_app/colors.dart';
import 'package:merdeka_app/components/custom_background.dart';
import 'package:velocity_x/velocity_x.dart';

class VelocityxScreen extends StatefulWidget {

  const VelocityxScreen({super.key});

  @override
  State<VelocityxScreen> createState() => _VelocityxScreenState();
}

class _VelocityxScreenState extends State<VelocityxScreen> {

  // instance
  late CustomColors custom;
  late TextEditingController emailController, passwordController;

  @override
  void initState() {
    super.initState();

    custom = CustomColors();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomBackground(
        child: VStack([
          "Email/Username".text.color(custom.green).size(16).make(),
          VxTextField(
            controller: emailController,
            hint: "Masukkan Email/Username",
            borderRadius: 8,
            fillColor: Colors.white,
            borderType: VxTextFieldBorderType.roundLine,
            borderColor: Colors.grey,
          ),
          8.heightBox,
          "Password".text.color(CustomColors.blue).size(16).make(),
          VxTextField(
            controller: passwordController,
            hint: "Masukkan Password",
            borderRadius: 8,
            fillColor: Colors.white,
            isPassword: true,
            borderType: VxTextFieldBorderType.roundLine,
            borderColor: Colors.grey,
          ),
          16.heightBox,
          VxBox(
            child: "Login".text.white.size(18).makeCentered()
          ).height(48).width(double.infinity).roundedLg.blue600.make().pOnly(top: 8).onTap((){
            actionLogin();
          }),
          // VxTimerButton(
          //   second: 10,
          //   bgColor: Colors.blue,
          //   textColor: Colors.black,
          // ),
          HStack([
            Icon(Icons.facebook, size: 36),
            16.widthBox,
            Icon(Icons.apple, size: 36),
          ]).centered().pOnly(top: 24),
          // VxShimmer(
          //   child: VxBox(
          //     child: "Login".text.white.size(18).makeCentered()
          // ).height(48).width(double.infinity).roundedLg.blue600.make().pOnly(top: 8),
          //),
        ]).p16().safeArea(),
      )
    );
  }

  void actionLogin(){
    var email = emailController.text;
    var password = passwordController.text;
    debugPrint("Email: $email, Password: $password");
  }

}
