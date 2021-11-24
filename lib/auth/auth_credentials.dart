import 'package:flutter/cupertino.dart';

class AuthCredentials {
  String username;
  String email;
  String password;
  String userId;


  AuthCredentials({
    this.username,
    this.email,
    this.password,
    this.userId,
  });

  factory AuthCredentials.fromJson(Map<String, dynamic> json) =>
    _$AuthCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$AuthCredentialsToJson(this);
}

AuthCredentials _$AuthCredentialsFromJson(Map<String, dynamic> json) {
  return AuthCredentials()
    ..userId = json['userId'] as String
    ..username = json['username'] as String
    ..email = json['email'] as String
    ..password = json['password'] as String;
}

Map<String, dynamic> _$AuthCredentialsToJson(AuthCredentials instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'email': instance.email,
      'password': instance.password,
    };