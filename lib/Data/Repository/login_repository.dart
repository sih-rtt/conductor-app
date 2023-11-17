import 'dart:convert';

import 'package:conductor_app/Data/Models/login_reponse.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  LoginRepository();
  Future<Login> loginrequest(String conductorId, String password) async {
    final dio = Dio();
    Response response = await dio.post('http://localhost:3000/user/login',
        data: {conductorId: conductorId, password: password});
    if (response.statusCode == 200) {
      final loginreponse = Login.fromjson(jsonDecode(response.data));
      return loginreponse;
    } else {
      throw Exception(response.data);
    }
  }
}
