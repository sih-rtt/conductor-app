import 'dart:convert';

import 'package:conductor_app/Data/Models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LoginRepository {
  LoginRepository();
  Future<Login> loginrequest(String conductorId, String password) async {
    final dio = Dio();

    Response response = await dio.post(
      'http://10.0.2.2:3000/conductor/login',
      data: jsonEncode({
        'conductorId': conductorId,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      final parsedResponse = jsonDecode(response.data);
      final loginreponse = Login.fromjson(parsedResponse);

      const storage = FlutterSecureStorage(
        aOptions: AndroidOptions(encryptedSharedPreferences: true),
      );
      await storage.write(
        key: 'accessToken',
        value: loginreponse.accessToken,
      );
      await storage.write(
        key: 'refreshToken',
        value: loginreponse.refreshToken,
      );

      return const Login(
        accessToken: "loginreponse.accessToken",
        refreshToken: "loginreponse.refreshToken",
      );
    } else {
      throw Exception(response.data);
    }
  }
}
