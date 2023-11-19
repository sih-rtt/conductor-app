import 'package:bloc/bloc.dart';
import 'package:conductor_app/Data/Repository/login_repository.dart';
import 'package:equatable/equatable.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository}) : super(LoginInitial()) {
    on<LoginEvent>((event, emit) {});
    on<LoginSubmitted>((event, emit) async {
      emit(LoginLoading());
      try {
        await loginRepository.loginrequest(event.conductorId, event.password);

        emit(LoginSuccess());
      } catch (e) {
        emit(LoginFailure(e.toString()));
      }
    });
  }
}
