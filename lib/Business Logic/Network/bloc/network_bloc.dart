import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc() : super(NetworkInitial()) {
    on<ListenNetwork>((event, emit) {
      InternetConnection().onStatusChange.listen((InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            // The internet is now connected
            add(NetworkChanged(NetworkSuccess()));
            break;
          case InternetStatus.disconnected:
            add(NetworkChanged(NetworkFailure()));
            break;
        }
      });
    });
    on<NetworkChanged>((event, emit) {
      emit(event.internetConnection);
    });
  }
}
