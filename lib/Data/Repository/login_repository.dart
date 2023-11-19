import 'dart:convert';

import 'package:conductor_app/Data/Models/login_reponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepository {
  LoginRepository();
  Future<Login> loginrequest(String conductorId, String password) async {
    final dio = Dio();

    Response response = await dio.post(
      'http://10.0.2.2:3000/conductor/login',
      data: {'conductorId': conductorId, 'password': password},
    );
    if (response.statusCode == 200) {
      // final loginreponse = Login.fromJson(jsonDecode(response.data));

      const storage = FlutterSecureStorage(
          aOptions: AndroidOptions(encryptedSharedPreferences: true));
      await storage.write(key: 'accessToken', value: "asdasd");
      await storage.write(key: 'refreshToken', value: "asdasd");

      return const Login(accessToken: "Sdfsd", refreshToken: "werwe");
    } else {
      throw Exception(response.data);
    }
  }
}
