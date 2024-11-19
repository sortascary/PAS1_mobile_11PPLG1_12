class ResponseModel {
  final bool status;
  final String message;
  final String token;

  ResponseModel(
      {required this.token, required this.status, required this.message});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        status: json['status'],
        message: json['message'],
        token: json['token'] ?? "No token");
  }
}

class LoginModel {
  final String username;
  final String password;

  LoginModel({required this.username, required this.password});

  Map<String, dynamic> toJson() {
    return {'username': username, 'password': password};
  }
}

class RegisterModel {
  final String username;
  final String password;
  final String email;
  final String full_name;

  RegisterModel(
      {required this.username,
      required this.password,
      required this.email,
      required this.full_name});
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
      'email': email,
      'full_name': full_name
    };
  }
}
