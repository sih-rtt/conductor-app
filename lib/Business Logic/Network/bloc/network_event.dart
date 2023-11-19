part of 'network_bloc.dart';

class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class ListenNetwork extends NetworkEvent {}

// ignore: must_be_immutable
class NetworkChanged extends NetworkEvent {
  NetworkState internetConnection;
  NetworkChanged(this.internetConnection);
  @override
  List<Object> get props => [internetConnection];
}
