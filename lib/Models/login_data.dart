// To parse this JSON data, do
//
//     final loginData = loginDataFromJson(jsonString);

import 'dart:convert';

LoginData loginDataFromJson(String str) => LoginData.fromJson(json.decode(str));

String loginDataToJson(LoginData data) => json.encode(data.toJson());

class LoginData {
  LoginData({
    required this.email,
    required this.password,
  });

  late String email;
  late String password;

  factory LoginData.fromJson(Map<String, dynamic> json) => LoginData(
        email: json["Email"],
        password: json["Password"],
      );

  Map<String, dynamic> toJson() => {
        "Email": email,
        "Password": password,
      };
}
