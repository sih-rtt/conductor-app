import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class Login extends Equatable {
  final String? accessToken;
  final String? refreshToken;
  const Login({required this.accessToken, required this.refreshToken});

  // run : dart run build_runner build --delete-conflicting-outputs to
  // generate _$LoginFromJson & _$LoginTojson

  factory Login.fromJson(Map<String, dynamic> json) => _$LoginFromJson(json);

  Map<String, dynamic> toJson() => _$LoginToJson(this);

  @override
  List<Object?> get props => throw UnimplementedError();
}
