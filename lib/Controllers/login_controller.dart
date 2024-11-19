import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg1_12/Pages/dashboard_page.dart';
import 'package:pas1_mobile_11pplg1_12/Pages/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  
  var isobscure = true.obs;
  var username = ''.obs;
  var password = ''.obs;
  var email = ''.obs;
  var full_name= ''.obs;
  var logged = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserEmail();
  }

  Future<void> loadUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    username.value = prefs.getString('username') ?? '';
  }

  Future<void> login() async {
    if (logged == true) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('username', username.value);
      await prefs.setBool('logged', logged.value);
      Get.off(() => const DashboardPage());
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('logged') == true;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    await prefs.remove('logged');
    username.value = ''; // Clear the email variable
    logged.value = false;
    Get.offAll(() => LoginPage());
  }
}
