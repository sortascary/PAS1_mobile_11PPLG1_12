import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Controllers/login_controller.dart';
import 'package:pas1_mobile_11pplg1_12/Widget/mycolors.dart';

class ProfileMenu extends StatelessWidget {
  ProfileMenu({super.key});
  final LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: colortextW),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: colorheader,
          actions: [
            IconButton(
                onPressed: () {
                  loginController.logout();
                },
                icon: Icon(Icons.exit_to_app),
                color: Colors.red,)
          ],
        ),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(55.0)),
                color: colorheader
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.account_circle_sharp,
                    size: 150, // Size of the icon
                    color: colortextW, // Icon color
                  ),
                  SizedBox(height: 20),
                  Text(
                    loginController.username.value,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.bold,
                      color: colortextW),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: 20),
                  ListTile(
                    leading: Icon(Icons.account_circle_sharp),
                    title: Text('Account settings'),
                    subtitle: Text('Configure your account'),
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: Icon(Icons.help),
                    title: Text('Help'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
