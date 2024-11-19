import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pas1_mobile_11pplg1_12/Models/Login_models.dart';

class Apiservice{
  final String BaseUrl = "https://mediadwi.com/api";

  Future<ResponseModel> login(LoginModel userModel) async {
    try {
      final response = await http.post(
        Uri.parse('$BaseUrl/latihan/login'),
        body: userModel.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return ResponseModel.fromJson(responseData);
      } else {
        return ResponseModel(
          status: false,
          message: "Failed to load data. Status code: ${response.statusCode}",
          token: ""
        );
      }
    } catch (e) {
      print("Exception caught: $e");
      return ResponseModel(
        status: false,
        message: "Failed to load data: $e", 
        token: '',
      );
    }
  }

  Future<ResponseModel> Register(RegisterModel Register) async {
    try {
      final response = await http.post(
        Uri.parse('$BaseUrl/latihan/register-user'),
        body: Register.toJson(),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        return ResponseModel.fromJson(responseData);
      } else {
        return ResponseModel(
          status: false,
          message: "Failed to load data. Status code: ${response.statusCode}", 
          token: '',
        );
      }
    } catch (e) {
      print("Exception caught: $e");
      return ResponseModel(
        status: false,
        message: "Failed to load data: $e", 
        token: '',
      );
    }
  }
}