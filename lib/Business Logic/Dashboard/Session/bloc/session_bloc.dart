import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:latlong2/latlong.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  SessionBloc() : super(SessionInitial()) {
    on<CheckWhetherInSessionEvent>((event, emit) {
      emit(LoadingSession());
      //do logic for fetching session
    });
    on<StartSession>(
      (event, emit) {
        emit(LoadingSession());
        //do logic for starting session
      },
    );
    on<EndSession>(
      (event, emit) {
        emit(LoadingSession());
        //do logic for ending the session
      },
    );
  }
}
