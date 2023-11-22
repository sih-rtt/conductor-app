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

final class StartSession extends SessionEvent {}

final class StopSession extends SessionEvent {}
