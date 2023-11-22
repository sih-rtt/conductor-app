part of 'session_bloc.dart';

sealed class SessionEvent extends Equatable {
  const SessionEvent();

  @override
  List<Object> get props => [];
}

final class CheckWhetherInSessionEvent extends SessionEvent {
  final String conductorId;

  const CheckWhetherInSessionEvent({required this.conductorId});
  @override
  List<Object> get props => [conductorId];
}

final class StartSession extends SessionEvent {
  final String routeId;
  final String busId;
  final String conductorId;
  final LatLng currentLocation;
  final String startLocName;

  const StartSession(
      {required this.routeId,
      required this.busId,
      required this.conductorId,
      required this.currentLocation,
      required this.startLocName});
  @override
  List<Object> get props =>
      [routeId, busId, conductorId, currentLocation, startLocName];
}

final class EndSession extends SessionEvent {
  final LatLng endLocation;
  final String endType;
  final String sessionId;

  const EndSession(
      {required this.endLocation,
      required this.endType,
      required this.sessionId});
  @override
  List<Object> get props => [endLocation, endType, sessionId];
}
