import 'package:flutter/material.dart';
import 'package:merdeka_app/components/custom_button.dart';
import 'package:merdeka_app/model/LoginRequest.dart';
import 'package:merdeka_app/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late TextEditingController emailController, passwordController;
  bool isObscurePassword = true;
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: formLogin1(height, width)
    );
  }

  Widget formLogin2(double height, double width){
    return Stack(
      children: [
        Container(
          height: height,
          width: width,
          color: Colors.blueAccent,
          child: Padding(
            padding: const EdgeInsets.only(left: 32, top: 70, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Welcome to"),
                Text("Merdeka Mobile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(16),
            height: height * 0.75,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)
                )
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                    child: Text("Email/Username")),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Masukkan username atau email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    focusedBorder:  OutlineInputBorder(
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
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8)
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: (){
                          debugPrint("lupa pass");
                        },
                        child: Text("Lupa Password")
                    )
                ),
                SizedBox(height: 16),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                        )
                      ),
                      onPressed: (){},
                      child: Text("Login")
                  ),
                ),

              ],
            ),
          ),
        )
      ],
    );
  }

  Widget formLogin1(double height, double width){

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
                      Text("Merdeka Mobile", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18))
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
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: "Masukkan username atau email",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    focusedBorder:  OutlineInputBorder(
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
                TextField(
                  obscureText: isObscurePassword,
                  controller: passwordController,
                  decoration: InputDecoration(
                    hintText: "Password",
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    focusedBorder:  OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8)
                    ),
                    suffixIcon: IconButton(
                        onPressed: (){
                          setState(() {
                            isObscurePassword = !isObscurePassword;
                          });
                        },
                        icon: Icon(isObscurePassword ? Icons.visibility_off : Icons.visibility)
                    )
                  ),
                ),

                // SizedBox(height: 16),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text("Password")
                // ),
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: "Password",
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //     focusedBorder:  OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.blue),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //   ),
                // ),
                // SizedBox(height: 16),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text("Password")
                // ),
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: "Password",
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //     focusedBorder:  OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.blue),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //   ),
                // ),
                // SizedBox(height: 16),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text("Password")
                // ),
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: "Password",
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //     focusedBorder:  OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.blue),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //   ),
                // ),
                // SizedBox(height: 16),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text("Password")
                // ),
                // TextField(
                //   decoration: InputDecoration(
                //     hintText: "Password",
                //     enabledBorder: OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.grey),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //     focusedBorder:  OutlineInputBorder(
                //         borderSide: BorderSide(color: Colors.blue),
                //         borderRadius: BorderRadius.circular(8)
                //     ),
                //   ),
                // ),

                Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                        onTap: (){
                          debugPrint("lupa pass");
                        },
                        child: Text("Lupa Password")
                    )
                ),
                SizedBox(height: 16),
                // SizedBox(
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       style: ElevatedButton.styleFrom(
                //           backgroundColor: Colors.blue,
                //           shape: RoundedRectangleBorder(
                //               borderRadius: BorderRadius.circular(8)
                //           )
                //       ),
                //       onPressed: (){},
                //       child: Text("Login")
                //   ),
                // ),
                // CustomButton(
                //     title: "Test Login",
                //     color: Colors.green,
                //     onPressed: (){}
                // ),
                isLoading
                    ? CircularProgressIndicator()
                    : CustomButton(
                        title: "Login",
                        radius: 16,
                        onPressed: (){
                          actionLogin();
                        }
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void actionLogin() async {
    var email = emailController.text;
    var password = passwordController.text;

    if (email.isEmpty || password.isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Silahkan lengkapi yang kosong", style: TextStyle(color: Colors.white)),
          behavior: SnackBarBehavior.floating,
          backgroundColor: Colors.redAccent,
          action: SnackBarAction(
              label: "OK",
              onPressed: (){}
          ),
        )
      );
      return;
    }

    setState(() {
      isLoading = true;
    });

    var request = LoginRequest(username: email, password: password);
    await LoginService.login(request)
        .then((value){
          debugPrint("Token ${value.accessToken}");
        })
        .catchError((error){
          debugPrint("Error $error");
        })
        .whenComplete((){
          setState(() {
            isLoading = false;
          });
        });
  }

}
