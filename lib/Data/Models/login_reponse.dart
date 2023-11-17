import 'package:equatable/equatable.dart';

class Login extends Equatable {
  final String accessToken;
  final String refreshToken;

  const Login({required this.accessToken, required this.refreshToken});
  @override
  List<Object> get props => [accessToken, refreshToken];
  factory Login.fromjson(Map<String, dynamic> json) {
    return Login(accessToken: json['access'], refreshToken: json['refresh']);
  }
}
