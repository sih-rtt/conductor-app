part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

abstract class LoginSubmitted extends LoginEvent {
  final String conductorId;
  final String password;

  const LoginSubmitted({required this.conductorId, required this.password});
  @override
  List<Object> get props => [conductorId, password];
}
