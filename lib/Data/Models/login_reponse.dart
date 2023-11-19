import 'package:equatable/equatable.dart';
import 'package:json_serializable/json_serializable.dart';
import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
class Login extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  const Login({required this.accessToken, required this.refreshToken});
  
 
  factory Login.fromjson(Map<String, dynamic> json) => _$Logi

  @override
  List<Object> get props => [];
}
