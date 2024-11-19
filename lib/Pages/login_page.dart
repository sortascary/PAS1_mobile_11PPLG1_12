import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/ApiService.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/login_controller.dart';
import 'package:pas1_mobile_11pplg1_12/Models/Login_models.dart';
import 'package:pas1_mobile_11pplg1_12/Pages/Register_page.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mybutton.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycolors.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mytextfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final LoginController authController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            'Hey welcome back!',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colortextW),
          ),
          automaticallyImplyLeading: false,
          backgroundColor: colorheader,
        ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.sports_soccer_rounded, size: 150),
            SizedBox(height: 30),
            MyTextfield(
              labelText: "User",
              onChanged: (value) => authController.username.value = value,
            ),
            SizedBox(height: 20),
            Obx(
              () => MyTextfield(
                labelText: "Password",
                onChanged: (value) => authController.password.value = value,
                isPassword: true,
                isObscure: authController.isobscure.value,
                toggleVisibility: () {
                  authController.isobscure.value =
                      !authController.isobscure.value;
                },
              ),
            ),
            SizedBox(height: 20),
            Expanded(child: Container()),
            MyButton(
              text: "Login",
              onclick: () async {
                    LoginModel user = LoginModel(
                      username: authController.username.value,
                      password: authController.password.value,
                    );

                    // Call the login method from ApiService
                    try {
                      Apiservice apiService = Apiservice();
                      ResponseModel response = await apiService.login(user);

                      Get.snackbar(response.message, response.token);
                      authController.logged.value = response.status;
                      authController.login();
                    } catch (e) {
                      Get.snackbar('Error', 'Failed to login: $e');
                    }
                  },
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                authController.isobscure.value = true;
                authController.username.value = '';
                authController.password.value = '';
                Get.offAll(RegisterPage());
              },
              child: Text(
                'Dont have an account?',
                style: TextStyle(
                  color: Colors
                      .blue, // Optional: Change text color for a clickable look
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}